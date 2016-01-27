//  HOLA BORJA
//  Created by Borja Tarazona Raga on 20/1/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit
import CoreData




let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext


let newItem = NSEntityDescription.insertNewObjectForEntityForName("A1", inManagedObjectContext: managedObjectContext!) as! A1

let managedObjectContextC = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

let newItemC = NSEntityDescription.insertNewObjectForEntityForName("C1", inManagedObjectContext: managedObjectContextC!) as! C1


class Cultivo1: ResponsiveTextFieldViewController, UITextFieldDelegate {
    
    var pageSize = CGSizeMake(850,1100)
    
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
    
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == anchoCalleTextField{
            distanciaArboles.becomeFirstResponder()
        }else{
            distanciaArboles.resignFirstResponder()
        }
        return true;
    }
    
    
    
    @IBOutlet var densidadFoliar: UISegmentedControl!
    
    @IBAction func elegirDensidadFoliar(sender: AnyObject) {
        
        
        if (densidadFoliar.selectedSegmentIndex == 0) {
            
            newItem.densidadFoliar = 1.15
            caract.densidadFoliar = 1.15;
            newItem.densidadFoliarIndice = 0
            print("densidad foliar : alta")
        }
        else if (densidadFoliar.selectedSegmentIndex == 1){
            newItem.densidadFoliar = 1
            caract.densidadFoliar = 1;
            newItem.densidadFoliarIndice = 1
            print("densidad foliar : media")
        }
        else if (densidadFoliar.selectedSegmentIndex == 2){
            newItem.densidadFoliar = 0.9
            caract.densidadFoliar = 0.9;
            newItem.densidadFoliarIndice = 2
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
        
        
        newItem.anchoCalle = (anchoCalleTextField.text! as NSString).doubleValue
        newItemB.anchoCalle = (anchoCalleTextField.text! as NSString).doubleValue
        newItemB.anchoCalleViejo = (anchoCalleTextField.text! as NSString).doubleValue
        newItemC.anchoCalle = (anchoCalleTextField.text! as NSString).doubleValue
        newItem.distanciaArboles = (distanciaArboles.text! as NSString).doubleValue
        newItem.longitudArboles = (longitudArboles.text! as NSString).doubleValue
        newItem.anchuraArboles = (anchuraArboles.text! as NSString).doubleValue
        newItem.alturaArboles = (alturaArboles.text! as NSString).doubleValue
        
        
        /*caract.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
        caract.longitudArboles = (longitudArboles.text as NSString).doubleValue
        caract.distanciaArboles = (distanciaArboles.text as NSString).doubleValue
        caract.anchuraArboles = (anchuraArboles.text as NSString).doubleValue
        caract.alturaArboles = (alturaArboles.text as NSString).doubleValue
        caract.alturaMeseta = (alturaMeseta.text as NSString).doubleValue */
        //        var densidad = densidadFoliar.
        
        if (segue.identifier == "Cultivo"){
        
        let comprobacion = caract.anchoCalle * caract.longitudArboles * caract.distanciaArboles * caract.anchuraArboles * caract.alturaArboles 
        
        if anchoCalleTextField.text == "" || distanciaArboles.text == "" || longitudArboles.text == "" || anchuraArboles.text == "" || alturaArboles.text == "" {
            alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
        }
        }
            
        else{
            
            if (segue.identifier == "Cultivo"){
                let fetchRequest = NSFetchRequest(entityName: "A1")
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [A1] {
                    print(fetchResults[0].densidadFoliar)
                }
                let DestViewController = segue.destinationViewController as! Cultivo2
                DestViewController.caract2 = caract
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nuevo : updateBoquillas = updateBoquillas()
        //nuevo.updateBoquillas()
        
        if (newItem.densidadFoliar == 0){
            newItem.densidadFoliar = 1.15
            densidadFoliar.selectedSegmentIndex = 0
            print("densidad foliar : alta")
            
        }else {
            densidadFoliar.selectedSegmentIndex = newItem.densidadFoliarIndice
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