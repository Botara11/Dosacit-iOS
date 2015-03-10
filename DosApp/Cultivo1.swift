//  HOLA BORJA
//  Created by Borja Tarazona Raga on 20/1/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit
import CoreData




let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext

let newItem = NSEntityDescription.insertNewObjectForEntityForName("A1", inManagedObjectContext: managedObjectContext!) as A1


class Cultivo1: UIViewController {
    

    let caract = ParteA()
    
    
    var url : NSURL? = nil
    var request : NSMutableURLRequest? = nil
    var response : NSHTTPURLResponse? = nil
    
    var data: NSMutableData? = nil
    var done: (NSError?, NSData, NSString?) -> () = { (_, _, _) -> () in }
    
    
    @IBOutlet var boton: UIBarButtonItem!
    @IBOutlet var anchoCalleTextField: UITextField!
    @IBOutlet var distanciaArboles: UITextField!
    @IBOutlet var longitudArboles: UITextField!
    @IBOutlet var anchuraArboles: UITextField!
    @IBOutlet var alturaArboles: UITextField!
    @IBOutlet var alturaMeseta: UITextField!

    @IBOutlet var densidadFoliar: UISegmentedControl!
    
    @IBAction func elegirDensidadFoliar(sender: AnyObject) {
        
        
        if (densidadFoliar.selectedSegmentIndex == 0) {
            
            newItem.densidadFoliar = 1.15
            caract.densidadFoliar = 1.15;
            newItem.densidadFoliarIndice = 0
            println("densidad foliar : alta")
        }
        else if (densidadFoliar.selectedSegmentIndex == 1){
            newItem.densidadFoliar = 1
            caract.densidadFoliar = 1;
            newItem.densidadFoliarIndice = 1
            println("densidad foliar : media")
        }
        else if (densidadFoliar.selectedSegmentIndex == 2){
            newItem.densidadFoliar = 0.9
            caract.densidadFoliar = 0.9;
            newItem.densidadFoliarIndice = 2
            println("densidad foliar : baja")
        }
    }
    
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        
        
        newItem.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
        newItem.distanciaArboles = (distanciaArboles.text as NSString).doubleValue
        newItem.longitudArboles = (longitudArboles.text as NSString).doubleValue
        newItem.anchuraArboles = (anchuraArboles.text as NSString).doubleValue
        newItem.alturaArboles = (alturaArboles.text as NSString).doubleValue
        newItem.alturaMeseta = (alturaMeseta.text as NSString).doubleValue
        
        /*caract.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
        caract.longitudArboles = (longitudArboles.text as NSString).doubleValue
        caract.distanciaArboles = (distanciaArboles.text as NSString).doubleValue
        caract.anchuraArboles = (anchuraArboles.text as NSString).doubleValue
        caract.alturaArboles = (alturaArboles.text as NSString).doubleValue
        caract.alturaMeseta = (alturaMeseta.text as NSString).doubleValue */
//        var densidad = densidadFoliar.
        
        let comprobacion = caract.anchoCalle * caract.longitudArboles * caract.distanciaArboles * caract.anchuraArboles * caract.alturaArboles * caract.alturaMeseta
        
        if comprobacion == 0.0  {
            alert("ERROR",mensaje: "No pueden haber campos vacios y deben ser numeros")
        }
            
        else{
            
            if (segue.identifier == "Cultivo"){
                
                
                
                
                let fetchRequest = NSFetchRequest(entityName: "A1")
                if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
                    
                    
                    println(fetchResults[0].densidadFoliar)
                    
                }

                
                var DestViewController = segue.destinationViewController as Cultivo2
                DestViewController.caract2 = caract
            }
            
        }
        
    }
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (newItem.densidadFoliar == 0){
            newItem.densidadFoliar = 1.15
            densidadFoliar.selectedSegmentIndex = 0
            println("densidad foliar : alta")
            
        }else {
            densidadFoliar.selectedSegmentIndex = newItem.densidadFoliarIndice
        }
        
        anchoCalleTextField.keyboardType = UIKeyboardType.NumbersAndPunctuation
        distanciaArboles.keyboardType = UIKeyboardType.NumbersAndPunctuation
        longitudArboles.keyboardType = UIKeyboardType.NumbersAndPunctuation
        anchuraArboles.keyboardType = UIKeyboardType.NumbersAndPunctuation
        alturaArboles.keyboardType = UIKeyboardType.NumbersAndPunctuation
        alturaMeseta.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
            
            if (fetchResults[0].anchoCalle != 0){
                anchoCalleTextField.text = "\(fetchResults[0].anchoCalle)"
            }
            
            if (fetchResults[0].distanciaArboles != 0){
                distanciaArboles.text = "\(fetchResults[0].distanciaArboles)"
            }
            
            if (fetchResults[0].anchuraArboles != 0){
                anchuraArboles.text = "\(fetchResults[0].anchuraArboles)"
            }
            
            if (fetchResults[0].longitudArboles != 0){
                longitudArboles.text = "\(fetchResults[0].longitudArboles)"
            }
            
            if (fetchResults[0].alturaArboles != 0){
                alturaArboles.text = "\(fetchResults[0].alturaArboles)"
            }
            if (fetchResults[0].alturaMeseta != 0){
                alturaMeseta.text = "\(fetchResults[0].alturaMeseta)"
            }
        }

        
        
        
        
        
        let url = NSURL(string: "http://secuest.comuf.com/dosacitric/BBDD.html")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            var result : NSString = NSString(data: data, encoding: NSUTF8StringEncoding)!
            //            println(result)
            result.stringByReplacingOccurrencesOfString(",", withString: ".")
            var array1 = [String]()
            var boquillas = [String]()
            var boq = [String]()
            
            array1 = (result as String).componentsSeparatedByString("<!-- Hosting24 Analytics Code -->")
            boquillas = array1[0].componentsSeparatedByString("\n")
            let count = boquillas.count
            
            for item in boquillas{
                boq = item.componentsSeparatedByString("%%%")
                var k = Double()
                k = (boq[0] as NSString).doubleValue
                
            }
            println(boquillas)
            
            
            
            
        }
        
        task.resume()
        /*
        pagina = (new http()).connect("http://secuest.comuf.com/dosacitric/BBDD.html");
        pagina = pagina.replace(",", ".");
        String[] nuevo = pagina.split("<!-- Hosting24 Analytics Code -->");					//*****CAMBIAR CUANDO HAYA CAMBIADO EL HOSTING*****///
        /*				pagina = nuevo[0];
        //System.out.println(pagina);
        
        String[] boquillas = pagina.split("\n");
        for(int i=0;i<boquillas.length;i++){
        String[] boq = boquillas[i].split("%%%");
        
        //HAY DATOS QUE ESTAN VACIOS "" ASI QUE NO SE PUEDE HACER DOUBLE.PARSEDOUBLE()
        Double k = Double.parseDouble(boq[4])/java.lang.Math.pow(10.0,0.5);
        //MARCA - MODELO - DIAMETRO(puede no haber) - CAUDAL
        double dia;
        if(boq[2].compareTo("")!=0){
        dia = Double.parseDouble(boq[2]);
        }else
        dia = 0.0;
        //System.out.println(boq[1] + " "+boq[4]+"/("+boq[4]+"^0,5) = " +k);
        db.addBoquilla(boq[0],boq[1],dia,Double.parseDouble(boq[4]),k*java.lang.Math.pow(6.0,0.5),
        k*java.lang.Math.pow(7.0,0.5),
        k*java.lang.Math.pow(8.0,0.5),
        k*java.lang.Math.pow(9.0,0.5),
        k*java.lang.Math.pow(10.0,0.5),
        k*java.lang.Math.pow(11.0,0.5),
        k*java.lang.Math.pow(12.0,0.5),
        k*java.lang.Math.pow(13.0,0.5),
        k*java.lang.Math.pow(14.0,0.5),
        k*java.lang.Math.pow(15.0,0.5),
        k*java.lang.Math.pow(16.0,0.5),
        1);
        }
        
        
        ArrayList<String> boquillasZ1 = db.getBoquillas("Teejet", 0.4, 0.99,"p6");
        ArrayList<String> boquillasZ2 = db.getBoquillas("Teejet", 0.4, 0.99,"p6");
        ArrayList<String> boquillasZ3 = db.getBoquillas("Teejet", 0.4, 0.99,"p6");
        if(boquillasZ1!=null && boquillasZ2!=null && boquillasZ3!=null){
        //Se muestran
        }
        else{
        //No se muestra ninguna
        }
        for(int i=0;i<boquillasZ1.size();i++)
        System.out.println(boquillasZ1.get(i));
        */*/
        
        
    }
    
    @IBAction func accion(sender: AnyObject) {
        
        
        
        if anchoCalleTextField.text == ""  {
            // either textfield 1 or 2's text is empty
            alert("ERROR",mensaje: "Hay campos vacios")
            
        }
        else{
            
            
            
            println("ALGO")
            
            let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("Cultivo2")
            
            
            self.showViewController(vc as UIViewController, sender: vc)
            
        }
        //presentItemInfo()
        
    }
    
    func alert(title :String,mensaje: String){
        let alertController = UIAlertController(title: title, message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentItemInfo() {
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
            
            //let alert = UIAlertController(title: fetchResults[0].anchoCalle,
            //  message: "Hola",
            //preferredStyle: .Alert)
            //
            //self.presentViewController(alert,
            //  animated: true,
            //completion: nil)
        }
    }
    
    
    
    
    
    
    
}