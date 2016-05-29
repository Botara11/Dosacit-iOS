//
//  SelecBoquillas1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 11/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData



class SelecBoquillas1: UIViewController, UITextFieldDelegate {
    
    var caract2 = ParteB()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var SwitchVC: UISwitch!
    @IBOutlet var SwitchV: UISwitch!
    @IBOutlet var SwitchAC: UISwitch!
    @IBOutlet var SwitchAS: UISwitch!
    @IBOutlet var SliderVelocidadAvance: UISlider!
    @IBOutlet var SliderVA: UISlider!
    
    
    @IBOutlet var VolumenCalculadoText: UITextView!
    @IBOutlet var VolumenSiguienteText: UITextField!
    @IBOutlet var AnchoSiguienteText: UITextField!
    @IBOutlet var AnchoCalculadoText: UITextView!
    
    
    @IBOutlet var VelocidadAvanceText: UITextField!
    
    @IBOutlet var CaudalLiquidoTotalText: UITextView!
    @IBOutlet var CaudalLiquidoSectorText: UITextView!
    @IBOutlet var NumTotalBoquillasText: UITextField!
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField.tag == 3){
            scrollView.setContentOffset(CGPointMake(0,250), animated: true)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(textField.tag == 3){
            scrollView.setContentOffset(CGPointMake(0,0), animated: true)
        }
    }
    
    @IBAction func editingVelocidadAvanceEnd(sender: AnyObject) {
        
        SliderVA.value = (VelocidadAvanceText.text! as NSString).floatValue;
        
        newItemB!.velocidadAvance = (round(SliderVA.value * 10)/10 as NSNumber).doubleValue
        do {
            try managedObjectContext!.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        caract2.calcularCaudalesB()
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
            
            CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
            CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
            
        }

        
    }
    
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
    
    
    func textFieldDidChange(VolumenSiguienteText: UITextField) {
        
        if SwitchV.on{
            newItemB!.volumenApp = (VolumenSiguienteText.text! as NSString).doubleValue
            caract2.calcularCaudalesB()
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                
                CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
            }
        }
    }
    
    
    
    func textFieldDidChangeAncho(AnchoSiguienteText: UITextField) {
        
        if SwitchAS.on{
            newItemB!.anchoCalle = (AnchoSiguienteText.text! as NSString).doubleValue
            caract2.calcularCaudalesB()
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                
                CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                
                CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
            }
        }
        //your code
    }
    
    
    @IBAction func SwitchPressedVC(sender: AnyObject) {
        if SwitchVC.on{
            SwitchV.setOn(false, animated: true)
            newItemB!.flagVolumen = 0
            
            if (VolumenSiguienteText.text == ""){
                
            }else{
                newItemB!.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItemB!.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
            }
            //VolumenSiguienteText.editable = false
            
            
            
        }
        else {
            SwitchV.setOn(true, animated: true)
            newItemB!.flagVolumen = 1
            
            if (VolumenSiguienteText.text == ""){
                
            }else{
                newItemB!.volumenApp = (VolumenSiguienteText.text! as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItemB!.volumenApp = (VolumenSiguienteText.text! as NSString).doubleValue
                
            }
        }
    }
    
    @IBAction func SwitchPressedV(sender: AnyObject) {
        if SwitchV.on{
            SwitchVC.setOn(false, animated: true)
            newItemB!.flagVolumen = 1
            if (VolumenSiguienteText.text == ""){
                
            }else{
                newItemB!.volumenApp = (VolumenSiguienteText.text! as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItemB!.volumenApp = (VolumenSiguienteText.text! as NSString).doubleValue
                
            }
            
            
            
            
        }
        else {
            SwitchVC.setOn(true, animated: true)
            newItemB!.flagVolumen = 0
            
            if (VolumenSiguienteText.text == ""){
            }else{
                newItemB!.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItemB!.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
            }
            //VolumenSiguienteText.editable = false
            
            
            
        }
    }
    
    @IBAction func SwitchPressedAC(sender: AnyObject) {
        
        if SwitchAC.on{
            SwitchAS.setOn(false, animated: true)
            newItemB!.flagAncho = 0
            if(AnchoCalculadoText.text == ""){
                
            }else{
                newItemB!.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            newItemB!.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            
            
            
        }
        else {
            SwitchAS.setOn(true, animated: true)
            newItemB!.flagAncho = 1
            if(AnchoSiguienteText.text == ""){
                
            }else{
                newItemB!.anchoCalle = (AnchoSiguienteText.text! as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            
            
            newItemB!.anchoCalle = (AnchoSiguienteText.text! as NSString).doubleValue
        }
        
    }
    
    @IBAction func SwitchPressedAS(sender: AnyObject) {
        
        if SwitchAS.on{
            SwitchAC.setOn(false, animated: true)
            newItemB!.flagAncho = 1
            // AnchoSiguienteText.editable = true
            if(AnchoSiguienteText.text == ""){
                
            }else{
                newItemB!.anchoCalle = (AnchoSiguienteText.text! as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            
            
            newItemB!.anchoCalle = (AnchoSiguienteText.text! as NSString).doubleValue
            
        }
        else {
            SwitchAC.setOn(true, animated: true)
            newItemB!.flagAncho = 0
            // AnchoSiguienteText.editable = false
            if(AnchoCalculadoText.text == ""){
                
            }else{
                newItemB!.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            newItemB!.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
        }
    }
    
    
    
    
    @IBAction func SliderChange(sender: AnyObject) {
        
        let CurrentValue:float_t = SliderVA.value;
        VelocidadAvanceText.text = String(format:"%.2f",CurrentValue)
        newItemB!.velocidadAvance = (round(SliderVA.value * 10)/10 as NSNumber).doubleValue
        do {
            try managedObjectContext!.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        caract2.calcularCaudalesB()
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
            
            CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
            CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        newItemB!.numeroTotalBoquillas = (NumTotalBoquillasText.text! as NSString).integerValue
        newItemB!.velocidadAvance = (VelocidadAvanceText.text! as NSString).doubleValue
        
        newItemB!.anchoCalleNuevo = (AnchoSiguienteText.text! as NSString).doubleValue
        newItemB!.volumenAppNuevo = (VolumenSiguienteText.text! as NSString).doubleValue
        if SwitchVC.on{
            newItemB!.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
            newItemB!.flagVolumen = 0
        }
        else {
            newItemB!.volumenApp = (VolumenSiguienteText.text! as NSString).doubleValue
            newItemB!.flagVolumen = 1
        }
        
        if SwitchAC.on{
            newItemB!.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            newItemB!.flagAncho = 0
        }
        else {
            newItemB!.anchoCalle = (AnchoSiguienteText.text! as NSString).doubleValue
            newItemB!.flagAncho = 1
            print("Entra en flagAncho = 1")
        }
        
        
        if(segue.identifier == "B1"){
            
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                if NumTotalBoquillasText.text == ""{
                    alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
                    
                    
                }else if (fetchResults[0].volumenApp == 0){
                    alert("ERROR",mensaje: "El volumen de la aplicación no puede ser cero")
                    
                }else if (fetchResults[0].anchoCalle == 0){
                    alert("ERROR",mensaje: "El ancho de trabajo no puede ser cero")
                }else if (fetchResults[0].velocidadAvance > 6.01 || fetchResults[0].velocidadAvance < 0.99){
                    alert("ERROR",mensaje: "La velocidad de avance tiene que estar comprendida entre 6.01 y 0.99")
                }
                print("\(fetchResults[0].numeroTotalBoquillas)")
                print("\(fetchResults[0].volumenApp)")
                print("\(fetchResults[0].anchoCalle)")
                print("\(fetchResults[0].velocidadAvance)")
                print("\(fetchResults[0].caudalLiquidoTotal)")
            }
        }
        
        do {
            try managedObjectContext!.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        VolumenSiguienteText.tag = 0
        AnchoSiguienteText.tag = 1
        VelocidadAvanceText.tag = 2
        NumTotalBoquillasText.tag = 3
        
        caract2.calcularCaudalesB()
        
        //VelocidadAvanceText.didChange(<#T##changeKind: NSKeyValueChange##NSKeyValueChange#>, valuesAtIndexes: <#T##NSIndexSet#>, forKey: <#T##String#>)
        
        //textFieldDidChangeVelocidadAvance
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
            print("SelecBoquill1 Objetos: \(fetchResults.count)")
            newItemB = fetchResults[0]
            
            AnchoSiguienteText.addTarget(self, action: "textFieldDidChangeAncho:", forControlEvents: UIControlEvents.EditingChanged)
            VolumenSiguienteText.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
            VolumenSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
            NumTotalBoquillasText.keyboardType = UIKeyboardType.NumbersAndPunctuation
            VolumenSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
            AnchoSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
            
            
            if(fetchResults[0].anchoCalleNuevo != 0){
                AnchoSiguienteText.text = "\(fetchResults[0].anchoCalleNuevo)"
            }
            
            if(fetchResults[0].volumenAppNuevo != 0){
                VolumenSiguienteText.text = "\(fetchResults[0].volumenAppNuevo)"
            }
            
            if(fetchResults[0].flagAncho==1){
                SwitchAS.setOn(true, animated: true)
                SwitchAC.setOn(false, animated: true)
            }
            if(fetchResults[0].flagVolumen==1){
                SwitchV.setOn(true, animated: true)
                SwitchVC.setOn(false, animated: true)
            }
            
            if(fetchResults[0].numeroTotalBoquillas != 0){
                NumTotalBoquillasText.text = "\(fetchResults[0].numeroTotalBoquillas)"
            }else{
                newItemB!.velocidadAvance=3;
            }
            
            if(fetchResults[0].velocidadAvance != 0){
                print("\(fetchResults[0].velocidadAvance)")
                VelocidadAvanceText.text = "\(fetchResults[0].velocidadAvance)"
                SliderVA.value = (fetchResults[0].velocidadAvance as NSNumber).floatValue
                
            }
            
            if fetchResults.count != 0 {
                CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
            }
            
            
            
        }
        
        //Coger Volumen y ancho calculado de A
        let fetchRequestA = NSFetchRequest(entityName: "A1")
        if let fetchResultsA = (try? managedObjectContext!.executeFetchRequest(fetchRequestA)) as? [A1] {
            VolumenCalculadoText.text = "\(fetchResultsA[0].volumenAplicacionLHA)"
            AnchoCalculadoText.text = "\(fetchResultsA[0].anchoCalle)"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func alert(title :String,mensaje: String){
        let alertController = UIAlertController(title: title, message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
}
