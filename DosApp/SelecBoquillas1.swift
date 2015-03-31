//
//  SelecBoquillas1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 11/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

let managedObjectContextB = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext

let newItemB = NSEntityDescription.insertNewObjectForEntityForName("B1", inManagedObjectContext: managedObjectContext!) as B1


class SelecBoquillas1: UIViewController {
    
    var caract2 = ParteB()
    
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
    @IBOutlet var VelocidadAvanceText: UITextView!
    @IBOutlet var CaudalLiquidoTotalText: UITextView!
    @IBOutlet var CaudalLiquidoSectorText: UITextView!
    @IBOutlet var NumTotalBoquillasText: UITextField!
    
    
    func textFieldDidChange(VolumenSiguienteText: UITextField) {
        
        if SwitchV.on{
            
        
        newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
        caract2.calcularCaudalesB()
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
            CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
            
            CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
            
        }
            
        }

        //your code
    }
    
    
    
    func textFieldDidChangeAncho(AnchoSiguienteText: UITextField) {
        
        if SwitchAS.on{
        newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
        caract2.calcularCaudalesB()
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
            CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
            
            CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
        }
        }
        //your code
    }
    
    
    @IBAction func SwitchPressedVC(sender: AnyObject) {
        if SwitchVC.on{
            SwitchV.setOn(false, animated: true)
            
            if (VolumenSiguienteText.text == ""){
                
            }else{
                newItemB.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItem.volumenAplicacionLHA = (VolumenCalculadoText.text as NSString).integerValue
                newItemB.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
            }
            //VolumenSiguienteText.editable = false
            
            
            
        }
        else {
            SwitchV.setOn(true, animated: true)
            if (VolumenSiguienteText.text == ""){
                
            }else{
                newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItem.volumenAplicacionLHA = (VolumenSiguienteText.text as NSString).integerValue
                newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
                
            }
            
            
            
            
        }
    }
    
    @IBAction func SwitchPressedV(sender: AnyObject) {
        if SwitchV.on{
            SwitchVC.setOn(false, animated: true)
            //VolumenSiguienteText.editable = true
            
            if (VolumenSiguienteText.text == ""){
                
            }else{
            newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
            caract2.calcularCaudalesB()
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                
                CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
                
                CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItem.volumenAplicacionLHA = (VolumenSiguienteText.text as NSString).integerValue
                newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
                
            }

            
            
            
        }
        else {
            SwitchVC.setOn(true, animated: true)
            
            if (VolumenSiguienteText.text == ""){
                
            }else{
                newItemB.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItem.volumenAplicacionLHA = (VolumenCalculadoText.text as NSString).integerValue
                newItemB.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
            }
            //VolumenSiguienteText.editable = false
            
            

        }
    }
    
    @IBAction func SwitchPressedAC(sender: AnyObject) {
        
        if SwitchAC.on{
            SwitchAS.setOn(false, animated: true)
            
            if(AnchoCalculadoText.text == ""){
                
            }else{
                newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            
            
            newItem.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
        

            
        }
        else {
            SwitchAS.setOn(true, animated: true)
            
            if(AnchoSiguienteText.text == ""){
                
            }else{
                newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            
            
            newItem.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
        }
        
    }
    
    @IBAction func SwitchPressedAS(sender: AnyObject) {
        
        if SwitchAS.on{
            SwitchAC.setOn(false, animated: true)
           // AnchoSiguienteText.editable = true
            if(AnchoSiguienteText.text == ""){
                
            }else{
            newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            caract2.calcularCaudalesB()
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                
                CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
                
                CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
            }
            }

            
            newItem.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            
        }
        else {
            SwitchAC.setOn(true, animated: true)
           // AnchoSiguienteText.editable = false
            if(AnchoCalculadoText.text == ""){
                
            }else{
                newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            
            
            newItem.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            

        }
    }
    
    
    
    
    @IBAction func SliderChange(sender: AnyObject) {
        
        var CurrentValue:float_t = SliderVA.value
        VelocidadAvanceText.text = String(format:"%.2f",CurrentValue)
        newItemB.velocidadAvance = (CurrentValue as NSNumber).doubleValue
        caract2.calcularCaudalesB()
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
            CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
        CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if NumTotalBoquillasText.text == ""{
             alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
            
            
        }else{
        
        newItemB.numeroTotalBoquillas = (NumTotalBoquillasText.text as NSString).integerValue
        
        
        if SwitchVC.on{
            newItem.volumenAplicacionLHA = (VolumenCalculadoText.text as NSString).integerValue
            newItemB.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
        }
        else {
            newItem.volumenAplicacionLHA = (VolumenSiguienteText.text as NSString).integerValue
            newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
            
        }
        
        if SwitchAC.on{
            newItem.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            
        }
        else {
            newItem.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
        }
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newItemB.velocidadAvance = 3;
        AnchoSiguienteText.addTarget(self, action: "textFieldDidChangeAncho:", forControlEvents: UIControlEvents.EditingChanged)
        VolumenSiguienteText.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        //VolumenSiguienteText!.delegate = self
        //VolumenSiguienteText.editable = false
        VolumenSiguienteText.keyboardType = UIKeyboardType.NumberPad
        NumTotalBoquillasText.keyboardType = UIKeyboardType.NumberPad
        VolumenSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        //AnchoSiguienteText.editable = false
        AnchoSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        SliderVA.value = (VelocidadAvanceText.text as NSString).floatValue
        
        caract2.calcularCaudalesB()
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
            CaudalLiquidoTotalText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal)
            
            CaudalLiquidoSectorText.text = String(format:"%.2f",fetchResults[0].caudalLiquidoTotal/2)
        }
        
        let fetchRequestA = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequestA, error: nil) as? [A1] {
            
            VolumenCalculadoText.text = "\(fetchResults[0].volumenAplicacionLHA)"
            AnchoCalculadoText.text = "\(fetchResults[0].anchoCalle)"
            
            
        }
        // Do any additional setup after loading the view, typically from a nib.
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
