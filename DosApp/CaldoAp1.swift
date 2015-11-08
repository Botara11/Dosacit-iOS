//
//  CaldoAp1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 9/5/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

class CaldoAp1: ResponsiveTextFieldViewController {
    
    var caract2 = ParteB()
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newItemB.parteAoB = 0;
        anchoCalleTextField.keyboardType = UIKeyboardType.NumbersAndPunctuation
        velocidadAvanceTextField.keyboardType = UIKeyboardType.NumbersAndPunctuation
        boquillasAltaTextField.keyboardType = UIKeyboardType.NumberPad
        boquillasMediaTextField.keyboardType = UIKeyboardType.NumberPad
        boquillasBajaTextField.keyboardType = UIKeyboardType.NumberPad
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1]{
            
            
                anchoCalleText.text = String(format:"%.2f",fetchResults[0].anchoCalle)
                velocidadAvance.text = String(format:"%.1f",fetchResults[0].velocidadAvance)
            
            
        }
        
        let fetchRequest1 = NSFetchRequest(entityName: "C1")
        if let fetchResults = managedObjectContextC!.executeFetchRequest(fetchRequest, error: nil) as? [C1]{
            
            
            
            
            
        }
        
    }
    
    
    @IBAction func SwitchPressedAC(sender: AnyObject) {
        
        if SwitchAC.on{
            SwitchAS.setOn(false, animated: true)
            
            if(anchoCalleText.text == ""){
                
            }else{
                newItemB.anchoCalle = (anchoCalleText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
            }
            
            
            newItem.anchoCalle = (anchoCalleText.text as NSString).doubleValue
            newItemB.anchoCalle = (anchoCalleText.text as NSString).doubleValue
            newItemC.anchoCalle = (anchoCalleText.text as NSString).doubleValue
            
            
        }
        else {
            SwitchAS.setOn(true, animated: true)
            
            if(anchoCalleTextField.text == ""){
                
            }else{
                newItemB.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                
            }
            
            newItem.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
            newItemB.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
            newItemC.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
        }
        
    }
    
    @IBAction func SwitchPressedAS(sender: AnyObject) {
        
        if SwitchAS.on{
            SwitchAC.setOn(false, animated: true)
            // AnchoSiguienteText.editable = true
            if(anchoCalleTextField.text == ""){
                
            }else{
                
                alert("Bu", mensaje: anchoCalleTextField.text)
                newItemB.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
                caract2.calcularCaudalesB()
            }
            newItem.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
            newItemB.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
            newItemC.anchoCalle = (anchoCalleTextField.text as NSString).doubleValue
            
        }
        else {
            SwitchAC.setOn(true, animated: true)
            // AnchoSiguienteText.editable = false
            
            if(anchoCalleText.text == ""){
            }else{
            
            newItemB.anchoCalle = (anchoCalleText.text as NSString).doubleValue
            caract2.calcularCaudalesB()
            
            newItem.anchoCalle = (anchoCalleText.text as NSString).doubleValue
            newItemB.anchoCalle = (anchoCalleText.text as NSString).doubleValue
            newItemC.anchoCalle = (anchoCalleText.text as NSString).doubleValue
            }
        }

    }
    
    
    @IBAction func SwitchPressedVC(sender: AnyObject) {
        
        if SwitchVC.on{
            SwitchVS.setOn(false, animated: true)
            
            if (velocidadAvance.text == ""){
                
            }else{
                newItemB.velocidadAvance = (velocidadAvance.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                
                newItemB.velocidadAvance = (velocidadAvance.text as NSString).doubleValue
                newItemC.velocidadAvance = (velocidadAvance.text as NSString).doubleValue
            }
            //VolumenSiguienteText.editable = false
            
            
            
        }
        else {
            SwitchVS.setOn(true, animated: true)
            if (velocidadAvanceTextField.text == ""){
                
            }else{
                newItemB.velocidadAvance = (velocidadAvanceTextField.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                newItemB.velocidadAvance = (velocidadAvanceTextField.text as NSString).doubleValue
                newItemC.velocidadAvance = (velocidadAvanceTextField.text as NSString).doubleValue
                
            }
            
            
        
            
        }
        
        

        
    }
    
    
    @IBAction func SwitchPressedVS(sender: AnyObject) {
        if SwitchVS.on{
            SwitchVC.setOn(false, animated: true)
            //VolumenSiguienteText.editable = true
            
            if (velocidadAvanceTextField.text == ""){
                
            }else{
                newItemB.velocidadAvance = (velocidadAvanceTextField.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                
                newItemB.velocidadAvance = (velocidadAvanceTextField.text as NSString).doubleValue
                newItemC.velocidadAvance = (velocidadAvanceTextField.text as NSString).doubleValue
                
            }
            
            
            
            
        }
        else {
            SwitchVC.setOn(true, animated: true)
            if (velocidadAvance.text == ""){
                
            }else{
            
                newItemB.velocidadAvance = (velocidadAvance.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                
                newItemB.velocidadAvance = (velocidadAvance.text as NSString).doubleValue
                newItemC.velocidadAvance = (velocidadAvance.text as NSString).doubleValue
            }
            
            //VolumenSiguienteText.editable = false
            
            
            
        }

        
    }
    
   
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){
        
        
        newItemB.numeroBoquillasAbiertasAlta = (boquillasAltaTextField.text as NSString).integerValue
        newItemB.numeroBoquillasAbiertasMedia = (boquillasMediaTextField.text as NSString).integerValue
        newItemB.numeroBoquillasAbiertasBaja = (boquillasBajaTextField.text as NSString).integerValue
        newItemC.numBoqAbiertasAltaHidraulica = (boquillasAltaTextField.text as NSString).integerValue
        newItemC.numBoqAbiertasMediaHidraulica = (boquillasMediaTextField.text as NSString).integerValue
        newItemC.numBoqAbiertasBajaHidraulica = (boquillasBajaTextField.text as NSString).integerValue
        
        if(segue.identifier == "C12"){
            
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                if (boquillasAltaTextField.text == "" || boquillasMediaTextField.text == "" || boquillasBajaTextField.text == ""){
                    alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
                    
                    
                }else if (fetchResults[0].anchoCalle == 0){
                    alert("ERROR",mensaje: "El ancho de calle no puede ser cero")
                    
                }else if (fetchResults[0].velocidadAvance == 0){
                    alert("ERROR",mensaje: "La velocidad de avance no puede ser cero")
                    
                }else{
                    
                    
                    newItemB.numeroBoquillasAbiertasAlta = (boquillasAltaTextField.text as NSString).integerValue
                    newItemB.numeroBoquillasAbiertasMedia = (boquillasMediaTextField.text as NSString).integerValue
                    newItemB.numeroBoquillasAbiertasBaja = (boquillasBajaTextField.text as NSString).integerValue
                    newItemC.numBoqAbiertasAltaHidraulica = (boquillasAltaTextField.text as NSString).integerValue
                    newItemC.numBoqAbiertasMediaHidraulica = (boquillasMediaTextField.text as NSString).integerValue
                    newItemC.numBoqAbiertasBajaHidraulica = (boquillasBajaTextField.text as NSString).integerValue
                    
                    
                    
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