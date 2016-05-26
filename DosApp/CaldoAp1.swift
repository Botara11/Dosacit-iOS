//
//  CaldoAp1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 9/5/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

class CaldoAp1: UIViewController, UITextFieldDelegate  {
    
    
    @IBOutlet var anchoCalleText: UITextView!
    @IBOutlet var velocidadAvance: UITextView!
    
    @IBOutlet var anchoCalleTextField: UITextField!
    
    @IBOutlet var velocidadAvanceTextField: UITextField!
    @IBOutlet var boquillasAltaTextField: UITextField!
    @IBOutlet var boquillasMediaTextField: UITextField!
    @IBOutlet var boquillasBajaTextField: UITextField!
    
    @IBOutlet var SwitchAC: UISwitch!
    @IBOutlet var SwitchAS: UISwitch!
    
    @IBOutlet var SwitchVC: UISwitch!
    @IBOutlet var SwitchVS: UISwitch!
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1]{
            newItemB = fetchResults[0]
            
            anchoCalleText.text = String(format:"%.2f",fetchResults[0].anchoCalle)
            velocidadAvance.text = String(format:"%.1f",fetchResults[0].velocidadAvance)
        }
        
        let fetchRequest2 = NSFetchRequest(entityName: "C1")
        if let fetchResults2 = (try? managedObjectContext!.executeFetchRequest(fetchRequest2)) as? [C1]{
            print("CaldoAp1 Objetos: \(fetchResults2.count)")
            
            if (fetchResults2[0].anchoCalle != newItemB!.anchoCalle){
                anchoCalleTextField.text = String(format:"%.2f",fetchResults2[0].anchoCalle)
                SwitchAS.setOn(true, animated: true)
                SwitchAC.setOn(false, animated: true)
            }
            boquillasAltaTextField.text = String(fetchResults2[0].numBoqAbiertasAltaHidraulica)
            boquillasMediaTextField.text = String(fetchResults2[0].numBoqAbiertasMediaHidraulica)
            boquillasBajaTextField.text = String(fetchResults2[0].numBoqAbiertasBajaHidraulica)
            print ("Load: \(fetchResults2[0].numBoqAbiertasAltaHidraulica) + \(fetchResults2[0].numBoqAbiertasMediaHidraulica) + \(fetchResults2[0].numBoqAbiertasBajaHidraulica)")
            if (fetchResults2[0].velocidadAvance != newItemB!.velocidadAvance){
                velocidadAvanceTextField.text = String(format:"%.2f",fetchResults2[0].velocidadAvance)
                SwitchVS.setOn(true, animated: true)
                SwitchVC.setOn(false, animated: true)
            }
            
            
        }
        
        anchoCalleTextField.addTarget(self, action: "textFieldDidChangeAncho:", forControlEvents: UIControlEvents.EditingChanged)
        velocidadAvanceTextField.addTarget(self, action: "textFieldDidChangeVelocidad:", forControlEvents: UIControlEvents.EditingChanged)
        
        anchoCalleTextField.tag = 0
        boquillasAltaTextField.tag = 1
        boquillasMediaTextField.tag = 2
        boquillasBajaTextField.tag = 3
        velocidadAvanceTextField.tag = 4
        
        anchoCalleTextField.keyboardType = UIKeyboardType.NumbersAndPunctuation
        velocidadAvanceTextField.keyboardType = UIKeyboardType.NumbersAndPunctuation
        boquillasAltaTextField.keyboardType = UIKeyboardType.NumberPad
        boquillasMediaTextField.keyboardType = UIKeyboardType.NumberPad
        boquillasBajaTextField.keyboardType = UIKeyboardType.NumberPad
        
        
        
    }
    
    
    @IBAction func SwitchPressedAC(sender: AnyObject) {
        
        if SwitchAC.on{
            SwitchAS.setOn(false, animated: true)
        }
        else {
            SwitchAS.setOn(true, animated: true)
        }
    }
    
    @IBAction func SwitchPressedAS(sender: AnyObject) {
        if SwitchAS.on{
            SwitchAC.setOn(false, animated: true)
            // AnchoSiguienteText.editable = true
        }
        else {
            SwitchAC.setOn(true, animated: true)
            // AnchoSiguienteText.editable = false
        }
    }
    
    
    func textFieldDidChangeAncho(AnchoSiguienteText: UITextField) {
        if SwitchAS.on{
            SwitchAC.setOn(false, animated: true)
            // AnchoSiguienteText.editable = true
        }
        else {
            SwitchAC.setOn(true, animated: true)
            // AnchoSiguienteText.editable = false
        }
    }
    
    func textFieldDidChangeVelocidad(AnchoSiguienteText: UITextField) {
        if SwitchVC.on{
            SwitchVS.setOn(false, animated: true)
            // AnchoSiguienteText.editable = true
        }
        
    }
    
    
    @IBAction func SwitchPressedVC(sender: AnyObject) {
        
        if SwitchVC.on{
            SwitchVS.setOn(false, animated: true)
            //VolumenSiguienteText.editable = false
        }
        else {
            SwitchVS.setOn(true, animated: true)
        }
    }
    
    
    @IBAction func SwitchPressedVS(sender: AnyObject) {
        if SwitchVS.on{
            SwitchVC.setOn(false, animated: true)
            //VolumenSiguienteText.editable = true
        }
        else {
            SwitchVC.setOn(true, animated: true)
            
        }
        
        
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){
        
        let fetchRequest = NSFetchRequest(entityName: "C1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [C1] {
            newItemC = fetchResults[0]
            var miAncho = 0.0
            var miVelo = 0.0

            
            if SwitchAS.on{
                miAncho = (anchoCalleTextField.text! as NSString).doubleValue
            }
            else{
                miAncho = (anchoCalleText.text! as NSString).doubleValue
            }
            
            if SwitchVS.on{
                miVelo = (velocidadAvanceTextField.text! as NSString).doubleValue
            }
            else{
                miVelo = (velocidadAvance.text! as NSString).doubleValue
            }
            
            newItemC!.anchoCalle = miAncho
            newItemC!.velocidadAvance = miVelo
            newItemC!.numBoqAbiertasAltaHidraulica = (boquillasAltaTextField.text! as NSString).integerValue
            newItemC!.numBoqAbiertasMediaHidraulica = (boquillasMediaTextField.text! as NSString).integerValue
            newItemC!.numBoqAbiertasBajaHidraulica = (boquillasBajaTextField.text! as NSString).integerValue
            print ("Store : \(newItemC!.numBoqAbiertasAltaHidraulica) + \(newItemC!.numBoqAbiertasMediaHidraulica) + \(newItemC!.numBoqAbiertasBajaHidraulica)")
            do {
                try managedObjectContext!.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
            if(segue.identifier == "SelPres"){
                
                if (boquillasAltaTextField.text == "" || boquillasMediaTextField.text == "" || boquillasBajaTextField.text == ""){
                    alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
                    
                }else if (miAncho == 0){
                    alert("ERROR",mensaje: "El ancho de calle no puede ser cero")
                    
                }else if (miVelo == 0){
                    alert("ERROR",mensaje: "La velocidad de avance no puede ser cero")
                    
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