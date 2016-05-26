//
//  ID.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 8/11/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class ID: ResponsiveTextFieldViewController, UITextFieldDelegate {
    
    
    @IBOutlet var fechaText: UITextField!
    @IBOutlet var idParcelaText: UITextField!
    @IBOutlet var idTratamientoText: UITextField!
    @IBOutlet var referenciaText: UITextField!
    
    /*
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    if textField == fechaText{
    idParcelaText.becomeFirstResponder()
    }else{
    idParcelaText.resignFirstResponder()
    }
    return true;
    }*/
    
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "IDCultivo1"){
            
            
            if fechaText.text == "" || idParcelaText.text == "" || idTratamientoText.text == "" || referenciaText.text == "" {
                alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
            }
        }
        let fetchRequest = NSFetchRequest(entityName: "Z1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Z1] {
            print(fetchResults.count)
            
            fetchResults[0].fecha = fechaText.text! as String
            fetchResults[0].idParcela = idParcelaText.text! as String
            fetchResults[0].idTratamiento = idTratamientoText.text! as String
            fetchResults[0].referencia = referenciaText.text! as String
            print(idTratamientoText.text)
            do {
                try managedObjectContext!.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
    }
    
    func alert(title :String,mensaje: String){
        let alertController = UIAlertController(title: title, message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        
        
        fechaText.tag = 0
        idParcelaText.tag = 1
        idTratamientoText.tag = 2
        referenciaText.tag = 3
        
        let fetchRequest = NSFetchRequest(entityName: "Z1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Z1] {
            print("Numero de resultados: \(fetchResults.count)")
            
            if (fetchResults.count != 0 && fetchResults[0].fecha != "Sin fecha" ){
                fechaText.text = "\(fetchResults[0].fecha)"
            }else{
                fechaText.text = ""
            }
            
            if (fetchResults.count != 0 && fetchResults[0].idParcela != "Sin identificar"){
                idParcelaText.text = "\(fetchResults[0].idParcela)"
            }else{
                fechaText.text = ""
            }
            
            if ( fetchResults.count != 0 && fetchResults[0].idTratamiento != "Sin identificar"){
                idTratamientoText.text = "\(fetchResults[0].idTratamiento)"
            }else{
                fechaText.text = ""
            }
            
            if ( fetchResults.count != 0 && fetchResults[0].referencia != "Sin referencia"){
                referenciaText.text = "\(fetchResults[0].referencia)"
            }else{
                fechaText.text = ""
            }
        }
        
        
        //newItemZ.fecha = " Sin fecha"
        //newItemZ.idParcela = "Sin identificar"
        //newItemZ.idTratamiento = "Sin identificar"
        //newItemZ.referencia = "Sin referencia"
        
    }
    
}