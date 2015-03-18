//
//  SelecBoquillas1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 11/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

class SelecBoquillas1: UIViewController {
    
    
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
            
        }
        else {
            SwitchV.setOn(true, animated: true)
            VolumenSiguienteText.editable = true
        }
    }
    
    @IBAction func SwitchPressedV(sender: AnyObject) {
        if SwitchV.on{
            SwitchVC.setOn(false, animated: true)
            VolumenSiguienteText.editable = true
            
        }
        else {
            SwitchVC.setOn(true, animated: true)
            VolumenSiguienteText.editable = false
        }
    }
    
    @IBAction func SwitchPressedAC(sender: AnyObject) {
        
        if SwitchAC.on{
            SwitchAS.setOn(false, animated: true)
            AnchoSiguienteText.editable = false
            
        }
        else {
            SwitchAS.setOn(true, animated: true)
            AnchoSiguienteText.editable = true
        }
        
    }
    
    @IBAction func SwitchPressedAS(sender: AnyObject) {
        
        if SwitchAS.on{
            SwitchAC.setOn(false, animated: true)
            AnchoSiguienteText.editable = true
            
        }
        else {
            SwitchAC.setOn(true, animated: true)
            AnchoSiguienteText.editable = false
        }
    }
    
    
    
    
    @IBAction func SliderChange(sender: AnyObject) {
        
        var CurrentValue:float_t = SliderVA.value
        VelocidadAvanceText.text = "\(CurrentValue)"
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
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
