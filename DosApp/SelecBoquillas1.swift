//
//  SelecBoquillas1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 11/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

let managedObjectContextB = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

let newItemB = NSEntityDescription.insertNewObjectForEntityForName("B1", inManagedObjectContext: managedObjectContext!) as! B1


class SelecBoquillas1: ResponsiveTextFieldViewController {
    
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
            
            CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
            
            CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
            
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
            
            CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
            
            CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
        }
        }
        //your code
    }
    
    
    @IBAction func SwitchPressedVC(sender: AnyObject) {
        if SwitchVC.on{
            SwitchV.setOn(false, animated: true)
            newItemB.flagVolumen = 0
            
            if (VolumenSiguienteText.text == ""){
                
            }else{
                newItemB.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItem.volumenAplicacionLHA = (VolumenCalculadoText.text as NSString).integerValue
                newItemB.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
            }
            //VolumenSiguienteText.editable = false
            
            
            
        }
        else {
            SwitchV.setOn(true, animated: true)
            newItemB.flagVolumen = 1
            
            if (VolumenSiguienteText.text == ""){
                
            }else{
                newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItem.volumenAplicacionLHA = (VolumenSiguienteText.text as NSString).integerValue
                newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
                
            }
            
            
            
            
        }
    }
    
    @IBAction func SwitchPressedV(sender: AnyObject) {
        if SwitchV.on{
            SwitchVC.setOn(false, animated: true)
            newItemB.flagVolumen = 1
            
            
            //VolumenSiguienteText.editable = true
            
            if (VolumenSiguienteText.text == ""){
                
            }else{
            newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
            caract2.calcularCaudalesB()
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                
                CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                
                CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
                newItem.volumenAplicacionLHA = (VolumenSiguienteText.text as NSString).integerValue
                newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
                
            }

            
            
            
        }
        else {
            SwitchVC.setOn(true, animated: true)
            newItemB.flagVolumen = 0
            
            
            
            if (VolumenSiguienteText.text == ""){
                
            }else{
                newItemB.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
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
            newItemB.flagAncho = 0
            if(AnchoCalculadoText.text == ""){
                
            }else{
                newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            
            
            newItem.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
        

            
        }
        else {
            SwitchAS.setOn(true, animated: true)
            newItemB.flagAncho = 1
            if(AnchoSiguienteText.text == ""){
                
            }else{
                newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            
            
            newItem.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
        }
        
    }
    
    @IBAction func SwitchPressedAS(sender: AnyObject) {
        
        if SwitchAS.on{
            SwitchAC.setOn(false, animated: true)
            newItemB.flagAncho = 1
           // AnchoSiguienteText.editable = true
            if(AnchoSiguienteText.text == ""){
                
            }else{
            newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            caract2.calcularCaudalesB()
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                
                CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                
                CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
            }
            }

            
            newItem.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            
        }
        else {
            SwitchAC.setOn(true, animated: true)
            newItemB.flagAncho = 0
           // AnchoSiguienteText.editable = false
            if(AnchoCalculadoText.text == ""){
                
            }else{
                newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
                caract2.calcularCaudalesB()
                let fetchRequest = NSFetchRequest(entityName: "B1")
                if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                    
                    CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                    
                    CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
                }
            }
            
            
            newItem.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            

        }
    }
    
    
    
    
    @IBAction func SliderChange(sender: AnyObject) {
        
        var CurrentValue:float_t = SliderVA.value;
        VelocidadAvanceText.text = String(format:"%.1f",CurrentValue)
        newItemB.velocidadAvance = (round(SliderVA.value * 10)/10 as NSNumber).doubleValue
        newItemC.velocidadAvance = (round(SliderVA.value * 10)/10 as NSNumber).doubleValue
        caract2.calcularCaudalesB()
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
            CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
            CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        newItemB.numeroTotalBoquillas = (NumTotalBoquillasText.text as NSString).integerValue
        
        newItemB.velocidadAvance = (VelocidadAvanceText.text as NSString).doubleValue
        newItemC.velocidadAvance = (VelocidadAvanceText.text as NSString).doubleValue
        
        if SwitchVC.on{
            newItem.volumenAplicacionLHA = (VolumenCalculadoText.text as NSString).integerValue
            newItemB.volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
        }
        else {
            newItem.volumenAplicacionLHA = (VolumenSiguienteText.text as NSString).integerValue
            newItemB.volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
            newItemB.volumenAppNuevo = (VolumenSiguienteText.text as NSString).doubleValue
            
        }
        
        if SwitchAC.on{
            newItem.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            
        }else {
            newItem.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            newItemB.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            newItemB.anchoCalleNuevo = (AnchoSiguienteText.text as NSString).doubleValue
        }
        
        if(segue.identifier == "B1"){
            
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            if NumTotalBoquillasText.text == ""{
                alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
            
            
            }else if (fetchResults[0].volumenApp == 0){
                alert("ERROR",mensaje: "El volumen de la aplicación no puede ser cero")
                
            }else if (fetchResults[0].anchoCalle == 0){
                alert("ERROR",mensaje: "El ancho de trabajo no puede ser cero")
                
            }else{
        
                newItemB.numeroTotalBoquillas = (NumTotalBoquillasText.text as NSString).integerValue
                
                newItemB.velocidadAvance = (VelocidadAvanceText.text as NSString).doubleValue
                newItemC.velocidadAvance = (VelocidadAvanceText.text as NSString).doubleValue
        
        
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
                
                println("\(fetchResults[0].numeroTotalBoquillas)")
                println("\(fetchResults[0].volumenApp)")
                println("\(fetchResults[0].anchoCalle)")
                println("\(fetchResults[0].velocidadAvance)")
                println("\(fetchResults[0].caudalLiquidoTotal)")
        }
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newItem.parteAoB = 0;
        newItemB.parteAoB = 0;
        //newItemB.velocidadAvance = 3;
        AnchoSiguienteText.addTarget(self, action: "textFieldDidChangeAncho:", forControlEvents: UIControlEvents.EditingChanged)
        VolumenSiguienteText.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        //VolumenSiguienteText!.delegate = self
        //VolumenSiguienteText.editable = false
        VolumenSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        NumTotalBoquillasText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        VolumenSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        //AnchoSiguienteText.editable = false
        AnchoSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        //SliderVA.value = (VelocidadAvanceText.text as NSString).floatValue
        caract2.calcularCaudalesB()
        
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
            if(fetchResults[0].anchoCalleNuevo != 0){
                AnchoSiguienteText.text = "\(fetchResults[0].anchoCalleNuevo)"
                if(fetchResults[0].flagAncho==1){
                    SwitchAS.setOn(true, animated: true)
                    SwitchAC.setOn(false, animated: true)
                }
            }
            
            if(fetchResults[0].volumenAppNuevo != 0){
                VolumenSiguienteText.text = "\(fetchResults[0].volumenAppNuevo)"
                
                if(fetchResults[0].flagVolumen==1){
                    SwitchV.setOn(true, animated: true)
                    SwitchVC.setOn(false, animated: true)
                }
                
            }
            
            if(fetchResults[0].numeroTotalBoquillas != 0){
                NumTotalBoquillasText.text = "\(fetchResults[0].numeroTotalBoquillas)"
            }else{
                newItemB.velocidadAvance=3;
            }
            
            if(fetchResults[0].velocidadAvance != 0){
                println("\(fetchResults[0].velocidadAvance)")
                VelocidadAvanceText.text = "\(fetchResults[0].velocidadAvance)"
                SliderVA.value = (fetchResults[0].velocidadAvance as NSNumber).floatValue
                
            }
            
            if fetchResults.count != 0 {
                CaudalLiquidoTotalText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal)
                CaudalLiquidoSectorText.text = String(format:"%.1f",fetchResults[0].caudalLiquidoTotal/2)
            }
            VolumenCalculadoText.text = "\(fetchResults[0].volumenAppViejo)"
            AnchoCalculadoText.text = "\(fetchResults[0].anchoCalleViejo)"
            
            
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
