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

let newItemB = NSEntityDescription.insertNewObjectForEntityForName("B1", inManagedObjectContext: managedObjectContextB!) as B1


class SelecBoquillas1: UIViewController {
    
    var caract2 = ParteB()
    
    @IBOutlet var SwitchVC: UISwitch!
    @IBOutlet var SwitchV: UISwitch!
    @IBOutlet var SwitchAC: UISwitch!
    @IBOutlet var SwitchAS: UISwitch!
    @IBOutlet var SliderVelocidadAvance: UISlider!
    @IBOutlet var SliderVA: UISlider!
    
    
    @IBOutlet var VolumenCalculadoText: UITextView!
    @IBOutlet var VolumenSiguienteText: UITextView!
    @IBOutlet var AnchoCalculadoText: UITextView!
    @IBOutlet var AnchoSiguienteText: UITextView!
    @IBOutlet var VelocidadAvanceText: UITextView!
    @IBOutlet var CaudalLiquidoTotalText: UITextView!
    @IBOutlet var CaudalLiquidoSectorText: UITextView!
    
    
    
    @IBAction func SwitchPressedVC(sender: AnyObject) {
        if SwitchVC.on{
            SwitchV.setOn(false, animated: true)
            VolumenSiguienteText.editable = false
            newItem.volumenAplicacionLHA = (VolumenCalculadoText.text as NSString).integerValue
            
            
        }
        else {
            SwitchV.setOn(true, animated: true)
            VolumenSiguienteText.editable = true
            newItem.volumenAplicacionLHA = (VolumenSiguienteText.text as NSString).integerValue
            
        }
    }
    
    @IBAction func SwitchPressedV(sender: AnyObject) {
        if SwitchV.on{
            SwitchVC.setOn(false, animated: true)
            VolumenSiguienteText.editable = true
            newItem.volumenAplicacionLHA = (VolumenSiguienteText.text as NSString).integerValue
            
        }
        else {
            SwitchVC.setOn(true, animated: true)
            VolumenSiguienteText.editable = false
            newItem.volumenAplicacionLHA = (VolumenCalculadoText.text as NSString).integerValue
        }
    }
    
    @IBAction func SwitchPressedAC(sender: AnyObject) {
        
        if SwitchAC.on{
            SwitchAS.setOn(false, animated: true)
            AnchoSiguienteText.editable = false
            newItem.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            
        }
        else {
            SwitchAS.setOn(true, animated: true)
            AnchoSiguienteText.editable = true
            newItem.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
        }
        
    }
    
    @IBAction func SwitchPressedAS(sender: AnyObject) {
        
        if SwitchAS.on{
            SwitchAC.setOn(false, animated: true)
            AnchoSiguienteText.editable = true
            newItem.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
            
        }
        else {
            SwitchAC.setOn(true, animated: true)
            AnchoSiguienteText.editable = false
            newItem.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
        }
    }
    
    
    
    
    @IBAction func SliderChange(sender: AnyObject) {
        
        var CurrentValue:float_t = SliderVA.value
        VelocidadAvanceText.text = "\(CurrentValue)"
        newItemB.velocidadAvance = (CurrentValue as NSNumber).doubleValue
        caract2.calcularCaudalesB()
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
        CaudalLiquidoTotalText.text = "\(fetchResults[0].caudalLiquidoTotal)"
        CaudalLiquidoSectorText.text = "\(fetchResults[0].caudalLiquidoTotal/2)"
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
     
        
        
        if SwitchVC.on{
            newItem.volumenAplicacionLHA = (VolumenCalculadoText.text as NSString).integerValue
        }
        else {
            newItem.volumenAplicacionLHA = (VolumenSiguienteText.text as NSString).integerValue
        }
        
        if SwitchAC.on{
            newItem.anchoCalle = (AnchoCalculadoText.text as NSString).doubleValue
            
        }
        else {
            newItem.anchoCalle = (AnchoSiguienteText.text as NSString).doubleValue
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        VolumenSiguienteText.editable = false
        VolumenSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        AnchoSiguienteText.editable = false
        AnchoSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        SliderVA.value = (VelocidadAvanceText.text as NSString).floatValue
        
        
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
            
            VolumenCalculadoText.text = "\(fetchResults[0].volumenAplicacionLHA)"
            AnchoCalculadoText.text = "\(fetchResults[0].anchoCalle)"
            
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
