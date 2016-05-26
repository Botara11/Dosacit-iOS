//  HOLA BORJA
//  Created by Borja Tarazona Raga on 20/1/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit
import CoreData




class Cultivo1: UIViewController, UITextFieldDelegate {
     var anotherString = String()
    var pageSize = CGSizeMake(850,1100)
    
    let caract = ParteA()
    
    
//    var newItemA! : A1
    
    var url : NSURL? = nil
    var request : NSMutableURLRequest? = nil
    var response : NSHTTPURLResponse? = nil
    
    var data: NSMutableData? = nil
    var done: (NSError?, NSData, NSString?) -> () = { (_, _, _) -> () in }
    
    @IBOutlet var densidadFoliar: UISegmentedControl!
    @IBOutlet var boton: UIBarButtonItem!
    @IBOutlet var anchoCalleTextField: UITextField!
    
    @IBOutlet weak var alturaArboles: UITextField!
    @IBOutlet weak var anchuraArboles: UITextField!
    @IBOutlet weak var longitudArboles: UITextField!
    @IBOutlet weak var distanciaArboles: UITextField!
    @IBOutlet weak var formaArbol: UISegmentedControl!
    @IBOutlet weak var fechaUltimaPoda: UISegmentedControl!
    @IBOutlet weak var gradoPoda: UISegmentedControl!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag: NSInteger = textField.tag + 1;
        // Try to find next responder
        if let nextResponder: UIResponder! = textField.superview!.viewWithTag(nextTag){
            nextResponder.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        return false // We do not want UITextField to insert line-breaks.
    }

    
    @IBAction func formaArbol(sender: AnyObject) {
        
        if (formaArbol.selectedSegmentIndex == 0){
            caract.formaArbol = 1;
            newItemA!.formaArbol = 1
            newItemA!.esfericoSeto = 0
            caract.esfericoSeto = 0;
            print("densidad foliar : esferica")
        }
        else {
            caract.formaArbol = 1;
            caract.esfericoSeto = 1;
            newItemA!.formaArbol = 1
            newItemA!.esfericoSeto = 1
            print("densidad foliar : ")
        }

    }
    
    @IBAction func fechaUltimaPodaSelector(sender: AnyObject) {
        
        
        
        if (fechaUltimaPoda.selectedSegmentIndex == 0){
            newItemA!.fechaUltimaPoda = 0.95
            caract.fechaUltimaPoda = 0.95;
        }
        else if (fechaUltimaPoda.selectedSegmentIndex == 1){
            newItemA!.fechaUltimaPoda = 1
            caract.fechaUltimaPoda = 1;
            
        }
        else if(fechaUltimaPoda.selectedSegmentIndex == 2){
            newItemA!.fechaUltimaPoda = 1.075
            caract.fechaUltimaPoda = 1.075;
            
        }
        else {
            newItemA!.fechaUltimaPoda = 1.15
            caract.fechaUltimaPoda = 1.15;
            
        }
    }
    
    @IBAction func gradoPodaSelector(sender: AnyObject) {
        
        
        
        if (gradoPoda.selectedSegmentIndex == 0){
            caract.gradoPoda = 0.95;
            newItemA!.gradoPoda = 0.95
        }
        if (gradoPoda.selectedSegmentIndex == 1){
            caract.gradoPoda = 1;
            newItemA!.gradoPoda = 1
        }
        else {
            caract.gradoPoda = 1.05;
            newItemA!.gradoPoda = 1.05
        }
    }
    
    

    
    
    @IBAction func elegirDensidadFoliar(sender: AnyObject) {
        
        
        if (densidadFoliar.selectedSegmentIndex == 0) {
            
            newItemA!.densidadFoliar = 1.15
            caract.densidadFoliar = 1.15;
            newItemA!.densidadFoliarIndice = 0
            print("densidad foliar : alta")
        }
        else if (densidadFoliar.selectedSegmentIndex == 1){
            newItemA!.densidadFoliar = 1
            caract.densidadFoliar = 1;
            newItemA!.densidadFoliarIndice = 1
            print("densidad foliar : media")
        }
        else if (densidadFoliar.selectedSegmentIndex == 2){
            newItemA!.densidadFoliar = 0.9
            caract.densidadFoliar = 0.9;
            newItemA!.densidadFoliarIndice = 2
            print("densidad foliar : baja")
        }
    }
    
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "Cultivo3"){
            
            newItemA!.anchoCalle = (anchoCalleTextField.text! as NSString).doubleValue
            newItemA!.anchoCalle = (anchoCalleTextField.text! as NSString).doubleValue
            newItemB!.anchoCalleViejo = (anchoCalleTextField.text! as NSString).doubleValue
            newItemA!.anchoCalle = (anchoCalleTextField.text! as NSString).doubleValue
            newItemA!.distanciaArboles = (distanciaArboles.text! as NSString).doubleValue
            newItemA!.longitudArboles = (longitudArboles.text! as NSString).doubleValue
            newItemA!.anchuraArboles = (anchuraArboles.text! as NSString).doubleValue
            newItemA!.alturaArboles = (alturaArboles.text! as NSString).doubleValue
            
            
            
            let comprobacion = caract.anchoCalle * caract.longitudArboles * caract.distanciaArboles * caract.anchuraArboles * caract.alturaArboles
            
            if anchoCalleTextField.text == "" || distanciaArboles.text == "" || longitudArboles.text == "" || anchuraArboles.text == "" || alturaArboles.text == "" {
                alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
            }
            
            /*
            else{
            
            if (segue.identifier == "Cultivo"){
            let fetchRequest = NSFetchRequest(entityName: "A1")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [A1] {
            print(fetchResults[0].densidadFoliar)
            }
            let DestViewController = segue.destinationViewController as! Cultivo3
            DestViewController.caract2 = caract
            }
            
            } */
            
            do {
                try managedObjectContext!.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest2 = NSFetchRequest(entityName: "A1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest2)) as? [A1] {
            print("Cultivo1 Objetos: \(fetchResults.count)")
            newItemA! = fetchResults[0]
        }
        anchoCalleTextField.tag = 0
        distanciaArboles.tag = 1
        longitudArboles.tag = 2
        anchuraArboles.tag = 3
        alturaArboles.tag = 4
        
        
        //let nuevo : updateBoquillas = updateBoquillas()
        //nuevo.updateBoquillas()
        
        
        if (newItemA!.esfericoSeto == 0){
            newItemA!.formaArbol = 1
            newItemA!.esfericoSeto = 0
            formaArbol.selectedSegmentIndex = 0
        }else if (newItemA!.esfericoSeto == 1){
            newItemA!.formaArbol = 1
            newItemA!.esfericoSeto = 1
            formaArbol.selectedSegmentIndex = 1
        }
        
        if (newItemA!.fechaUltimaPoda == 0){
            newItemA!.fechaUltimaPoda = 0.95
            fechaUltimaPoda.selectedSegmentIndex = 0
        }else if (newItemA!.fechaUltimaPoda == 0.95){
            newItemA!.fechaUltimaPoda = 0.95
            fechaUltimaPoda.selectedSegmentIndex = 0
        }else if (newItemA!.fechaUltimaPoda == 1){
            newItemA!.fechaUltimaPoda = 1
            fechaUltimaPoda.selectedSegmentIndex = 1
        }else if (newItemA!.fechaUltimaPoda == 1.075){
            fechaUltimaPoda.selectedSegmentIndex = 2
        }else if (newItemA!.fechaUltimaPoda == 1.15){
            fechaUltimaPoda.selectedSegmentIndex = 3
        }
        
        if(newItemA!.gradoPoda == 0){
            newItemA!.gradoPoda = 0.95
            gradoPoda.selectedSegmentIndex = 0
        }else if (newItemA!.gradoPoda == 0.95){
            newItemA!.gradoPoda = 0.95
            gradoPoda.selectedSegmentIndex = 0
        }else if (newItemA!.gradoPoda == 1){
            newItemA!.gradoPoda = 1
            gradoPoda.selectedSegmentIndex = 1
        }else if (newItemA!.gradoPoda == 1.05){
            newItemA!.gradoPoda = 1.05
            gradoPoda.selectedSegmentIndex = 2
        }
        

        
        if (newItemA!.densidadFoliar == 0){
            newItemA!.densidadFoliar = 1.15
            densidadFoliar.selectedSegmentIndex = 0
            print("densidad foliar : alta")
            
        }else {
            densidadFoliar.selectedSegmentIndex = newItemA!.densidadFoliarIndice
        }
        
        anchoCalleTextField.keyboardType = UIKeyboardType.NumbersAndPunctuation
        distanciaArboles.keyboardType = UIKeyboardType.NumbersAndPunctuation
        longitudArboles.keyboardType = UIKeyboardType.NumbersAndPunctuation
        anchuraArboles.keyboardType = UIKeyboardType.NumbersAndPunctuation
        alturaArboles.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [A1] {
            
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
            
        }
        
        
    }
    
    @IBAction func accion(sender: AnyObject) {
        
        
        
        if anchoCalleTextField.text == ""  {
            // either textfield 1 or 2's text is empty
            alert("ERROR",mensaje: "Hay campos vacios")
            
        }
        else{
            print("ALGO")
            let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("Cultivo2")
            self.showViewController(vc as! UIViewController, sender: vc)
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
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [A1] {
            
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