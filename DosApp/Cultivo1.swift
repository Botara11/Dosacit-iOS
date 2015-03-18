

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
                if boq.count == 5 {
                    let dbBoquillas = NSEntityDescription.insertNewObjectForEntityForName("EntityBoquillas", inManagedObjectContext: self.managedObjectContext!) as EntityBoquillas
                    
                let k = Double((boq[4] as NSString).doubleValue / pow(10,0.5))
                let dia = (boq[2] as NSString).doubleValue

                dbBoquillas.marca = boq[0]
                dbBoquillas.modelo = boq[1]
                dbBoquillas.diametro = dia
                dbBoquillas.caudal = (boq[4] as NSString).doubleValue
                dbBoquillas.p6 = k * pow(6,0.5)
                dbBoquillas.p7 = k * pow(7,0.5)
                dbBoquillas.p8 = k * pow(8,0.5)
                dbBoquillas.p9 = k * pow(9,0.5)
                dbBoquillas.p10 = k * pow(10,0.5)
                dbBoquillas.p11 = k * pow(11,0.5)
                dbBoquillas.p12 = k * pow(12,0.5)
                dbBoquillas.p13 = k * pow(13,0.5)
                dbBoquillas.p14 = k * pow(14,0.5)
                dbBoquillas.p15 = k * pow(15,0.5)
                dbBoquillas.p16 = k * pow(16,0.5)
                
                

                }

            }
            println(boquillas[0])
/*
            let fetchRequest = NSFetchRequest(entityName: "EntityBoquillas")
            let fetchResults1 = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]
            *//*
            for var ue=0; ue<fetchResults1?.count; ue++ {
                println(fetchResults1?[ue].marca)
                println(fetchResults1?[ue].modelo)
                println(fetchResults1?[ue].caudal)
                println(fetchResults1?[ue].p6)
                println(fetchResults1?[ue].p7)
                println(fetchResults1?[ue].p16)
                
            }
            */
            
            
            /*********  AQUI EMPIEZA  **********/
            
            // Mirar: http://www.codingexplorer.com/getting-started-uitableview-swift/
            
            var marcasList: [String] = ["Teejet","Hardi","Albuz","Lechler","Discos","Otros"]
            
            var presionList: [String] = ["p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16"]
            
           let fetchRequest = NSFetchRequest(entityName: "EntityBoquillas")
            
            let sortDescriptor = NSSortDescriptor(key: "marca", ascending: true)
            
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            let intervaloCaudalAdmisible = [0.3,1.2,0.3,1.2,0.3,1.2] as [Double]
            
            for marca in marcasList {
                for presion in presionList {
                    //let predicate1 = NSPredicate(format: "(%@ >= %f) AND (%@<= %f) AND (Marca == %@)",   presion, intervaloCaudalAdmisible[0], presion, intervaloCaudalAdmisible[1], i)
                    
                
                    let str = (presion + " > %f AND " + presion + "< %f AND marca == %@"  ) as String
                    let predicate1 = NSPredicate(format: str , intervaloCaudalAdmisible[0], intervaloCaudalAdmisible[1], marca)
                    fetchRequest.predicate = predicate1
                    if let fetchResults1 = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]{
                        println(fetchResults1[0].marca)
                        println(fetchResults1[0].modelo)
                        println(fetchResults1[0].p6)
                        let predicate2 = NSPredicate(format: "(%@ >= %f) AND (%@<= %f) AND (Marca == %@)","p6", intervaloCaudalAdmisible[2], "p6", intervaloCaudalAdmisible[3], marca)
                        fetchRequest.predicate = predicate2
                        let fetchResults2 = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]
                        if (fetchResults2 != nil){
                            let predicate3 = NSPredicate(format: "(%@ >= %f) AND (%@<= %f) AND (Marca == %@)",presion, intervaloCaudalAdmisible[4], presion, intervaloCaudalAdmisible[5], marca)
                            fetchRequest.predicate = predicate3
                            let fetchResults3 = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]
                            if (fetchResults3 != nil){
                                /** Si hay resultados en las 3 zonas... **/
                                
                                println(marca)
                            }
                        }
                    }
                }
            }
            
            
           /* if  {
                logItems = fetchResults
            }
            */
            /*********  AQUI TERMINA  **********/
            
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