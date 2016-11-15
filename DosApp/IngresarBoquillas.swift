//
//  IngresarBoquillas.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 05/06/16.
//  Copyright © 2016 UPV. All rights reserved.
//

import Foundation

import UIKit
import CoreData

class IngresarBoquillas: UIViewController{
    
    
    @IBOutlet weak var marca: UITextField!
    @IBOutlet weak var caudal: UITextField!
    @IBOutlet weak var presion: UITextField!

    
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
        
        /*if (textField.tag == 1 || textField.tag == 2){
            if (Double(textField.text!) == nil){
                if(textField.tag == 1){ alert("ERROR",mensaje: "El campo \"Caudal\" tiene que ser un número")}else{ alert("ERROR",mensaje: "El campo \"Presion\" tiene que ser un número")}
            }else{
                textField.text = String(format:"%.2f", textField.text!)
            }
        }*/
        return false // We do not want UITextField to insert line-breaks.
    }
    
    
    
    override func viewDidLoad() {
        
        marca.tag = 0
        caudal.tag = 1
        presion.tag = 2
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ingresar"){
            //print (String(format:"%.2f", Double(caudal.text!)!))
            
            if (marca.text == "" || caudal.text == "" || presion.text == ""){
                alert("ERROR",mensaje: "No puede haber campos vacíos")
            }else{
                print((caudal.text! as NSString).doubleValue)
                if (Double(caudal.text!) == nil){
                    alert("ERROR",mensaje: "El campo \"Caudal\" tiene que ser un número")
                }else{
                    if (Double(presion.text!) == nil){
                        alert("ERROR",mensaje: "El campo \"Presion\" tiene que ser un número")
                    }else{
                        var newItemIngresar = NSEntityDescription.insertNewObjectForEntityForName("MisBoquillas", inManagedObjectContext: managedObjectContext!) as! MisBoquillas
                        newItemIngresar.marcamia = marca.text!
                        newItemIngresar.presionmia = Double(String(format:"%.1f", (presion.text! as NSString).doubleValue))!
                        newItemIngresar.caudalmio = Double(String(format:"%.1f",(caudal.text! as NSString).doubleValue))!
                        
                        let dbBoquillas = NSEntityDescription.insertNewObjectForEntityForName("EntityBoquillas", inManagedObjectContext: managedObjectContext!) as! EntityBoquillas
                        
                        let k = Double(newItemIngresar.caudalmio / pow(newItemIngresar.presionmia,0.5))
                        
                        
                        dbBoquillas.marca = "Mis boquillas"
                        dbBoquillas.modelo = newItemIngresar.marcamia
                        dbBoquillas.diametro = 0
                        dbBoquillas.caudal = newItemIngresar.caudalmio
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

                        do {
                            try managedObjectContext!.save()
                        } catch {
                            fatalError("Failure to save context: \(error)")
                        }

                    }
                }
            }
        }
    }

    func alert(title :String,mensaje: String){
        let alertController = UIAlertController(title: title, message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }


}














