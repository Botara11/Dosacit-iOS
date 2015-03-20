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
    @IBOutlet var SliderVA: UISlider!
    
    
    @IBOutlet var VolumenCalculadoText: UITextView!
    
    
    @IBOutlet var VolumenSiguienteText: UITextField!
    
    @IBOutlet var AnchoCalculadoText: UITextView!
    
    @IBOutlet var AnchoSiguienteText: UITextField!
    @IBOutlet var VelocidadAvanceText: UITextView!
    @IBOutlet var CaudalLiquidoTotalText: UITextView!
    @IBOutlet var CaudalLiquidoSectorText: UITextView!
    
    var volumenApp = 0.0
    
    var anchoTrabajo = 0.0
    var velocidadAvance = 3.0
    
    @IBAction func chngeVolSig(sender: AnyObject) {
        volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
        calcularLiquidoTotal()
    }
    
    @IBAction func chngeAnchSig(sender: AnyObject) {
        anchoTrabajo = (AnchoSiguienteText.text as NSString).doubleValue
        calcularLiquidoTotal()
    }
    @IBAction func SwitchPressedVC(sender: AnyObject) {
        if SwitchVC.on{
            SwitchV.setOn(false, animated: true)
            VolumenSiguienteText.enabled = false
            VolumenSiguienteText.text = ""
            volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
            calcularLiquidoTotal()
            
        }
        else {
            SwitchV.setOn(true, animated: true)
            VolumenSiguienteText.enabled = true
            volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
            calcularLiquidoTotal()
        }
    }
    
    @IBAction func SwitchPressedV(sender: AnyObject) {
        if SwitchV.on{
            SwitchVC.setOn(false, animated: true)
            VolumenSiguienteText.enabled = true
            volumenApp = (VolumenSiguienteText.text as NSString).doubleValue
            calcularLiquidoTotal()
            
        }
        else {
            SwitchVC.setOn(true, animated: true)
            VolumenSiguienteText.enabled = false
            VolumenSiguienteText.text = ""
            volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
            calcularLiquidoTotal()
        }
    }
    
    @IBAction func SwitchPressedAC(sender: AnyObject) {
        
        if SwitchAC.on{
            SwitchAS.setOn(false, animated: true)
            AnchoSiguienteText.enabled = false
            AnchoSiguienteText.text = ""
            anchoTrabajo = (AnchoCalculadoText.text as NSString).doubleValue
            calcularLiquidoTotal()
            
        }
        else {
            SwitchAS.setOn(true, animated: true)
            AnchoSiguienteText.enabled = true
            anchoTrabajo = (AnchoSiguienteText.text as NSString).doubleValue
            calcularLiquidoTotal()
        }
        
    }
    
    @IBAction func SwitchPressedAS(sender: AnyObject) {
        
        if SwitchAS.on{
            SwitchAC.setOn(false, animated: true)
            AnchoSiguienteText.enabled = true
            anchoTrabajo = (AnchoSiguienteText.text as NSString).doubleValue
            calcularLiquidoTotal()
            
        }
        else {
            SwitchAC.setOn(true, animated: true)
            AnchoSiguienteText.enabled = false
            AnchoSiguienteText.text = ""
            anchoTrabajo = (AnchoCalculadoText.text as NSString).doubleValue
            calcularLiquidoTotal()
        }
    }
    
    func calcularLiquidoTotal(){
        CaudalLiquidoTotalText.text = "\(Int(volumenApp*anchoTrabajo*velocidadAvance))"
        CaudalLiquidoSectorText.text = "\(Int(volumenApp*anchoTrabajo*velocidadAvance/2))"
    }
    
    
    //    caudalLiquidoTotal = volumenApp*anchoTrabajo*velocidadAvance / 600;  //600 HARCODEADO---------
    //caudalLiquidoSector = caudalLiquidoTotal / 2; // SectorIzquierdo y Sector Derecho
    
    @IBAction func SliderChange(sender: AnyObject) {
        var CurrentValue:Float = SliderVA.value
        CurrentValue = Float(round(10*CurrentValue)/10)
        VelocidadAvanceText.text = "\(CurrentValue)"
        velocidadAvance = Double(CurrentValue)
        calcularLiquidoTotal()
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        VolumenSiguienteText.enabled = false
        VolumenSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        AnchoSiguienteText.enabled = false
        AnchoSiguienteText.keyboardType = UIKeyboardType.NumbersAndPunctuation
        SliderVA.value = (VelocidadAvanceText.text as NSString).floatValue
        
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
            VolumenCalculadoText.text = "\(fetchResults[0].volumenAplicacionLHA)"
        }
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
            AnchoCalculadoText.text = "\(fetchResults[0].anchoCalle)"
        }
        
        volumenApp = (VolumenCalculadoText.text as NSString).doubleValue
        anchoTrabajo = (AnchoCalculadoText.text as NSString).doubleValue
        calcularLiquidoTotal()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
