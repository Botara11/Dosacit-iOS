//
//  SelecBoquillas2.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 14/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

class SelecBoquillas2: UIViewController {
    
    
    
   
    @IBOutlet var NumBoqCerrAlta: UITextField!
    @IBOutlet var NumBoqCerrBaja: UITextField!
    @IBOutlet var NumBoqAbAlta: UITextField!
    @IBOutlet var NumBoqAbMedia: UITextField!
    @IBOutlet var NumBoqAbBaja: UITextField!
    @IBOutlet var PorcentajeVegAlta: UITextField!
    @IBOutlet var PorcentajeVegMedia: UITextField!
    @IBOutlet var PorcentajeVegBaja: UITextField!
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if NumBoqCerrAlta.text == "" || NumBoqCerrBaja.text == "" || NumBoqAbAlta.text == "" || NumBoqAbBaja.text == "" || NumBoqAbMedia.text == "" || PorcentajeVegAlta.text == "" || PorcentajeVegBaja == "" || PorcentajeVegMedia.text == "" {
            
            alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
            
        }else{
       
        newItemB.numeroBoquillasCerradasAlta = (NumBoqCerrAlta.text as NSString).integerValue
        
        newItemB.numeroBoquillasCerradasBaja = (NumBoqCerrBaja.text as NSString).integerValue
        
        newItemB.numeroBoquillasAbiertasAlta = (NumBoqAbAlta.text as NSString).integerValue
        
        newItemB.numeroBoquillasAbiertasBaja = (NumBoqAbMedia.text as NSString).integerValue
        
        newItemB.numeroBoquillasAbiertasMedia = (NumBoqAbBaja.text as NSString).integerValue
        
        newItemB.porcentajeVegetacionAlta = (PorcentajeVegAlta.text as NSString).integerValue
        
        newItemB.porcentajeVegetacionBaja = (PorcentajeVegMedia.text as NSString).integerValue
        
        newItemB.porcentajeVegetacionMedia = (PorcentajeVegBaja.text as NSString).integerValue
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NumBoqCerrAlta.keyboardType = UIKeyboardType.NumberPad
        NumBoqCerrBaja.keyboardType = UIKeyboardType.NumbersAndPunctuation
        NumBoqAbAlta.keyboardType = UIKeyboardType.NumbersAndPunctuation
        NumBoqAbMedia.keyboardType = UIKeyboardType.NumbersAndPunctuation
        NumBoqAbBaja.keyboardType = UIKeyboardType.NumbersAndPunctuation
        PorcentajeVegAlta.keyboardType = UIKeyboardType.NumbersAndPunctuation
        PorcentajeVegMedia.keyboardType = UIKeyboardType.NumbersAndPunctuation
        PorcentajeVegBaja.keyboardType = UIKeyboardType.NumbersAndPunctuation
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
                
                if (fetchResults[0].numeroBoquillasCerradasAlta != 0){
                    NumBoqCerrAlta.text = "\(fetchResults[0].numeroBoquillasCerradasAlta)"
                }
                
                if (fetchResults[0].numeroBoquillasCerradasBaja != 0){
                    NumBoqCerrBaja.text = "\(fetchResults[0].numeroBoquillasCerradasBaja)"
                }
                
                if (fetchResults[0].numeroBoquillasAbiertasAlta != 0){
                    NumBoqAbAlta.text = "\(fetchResults[0].numeroBoquillasAbiertasAlta)"
                }
                
                if (fetchResults[0].numeroBoquillasAbiertasBaja != 0){
                    NumBoqAbBaja.text = "\(fetchResults[0].numeroBoquillasAbiertasBaja)"
                }
                
                if (fetchResults[0].numeroBoquillasAbiertasMedia != 0){
                    NumBoqAbMedia.text = "\(fetchResults[0].numeroBoquillasAbiertasMedia)"
                }
                if (fetchResults[0].porcentajeVegetacionAlta != 0){
                    PorcentajeVegAlta.text = "\(fetchResults[0].porcentajeVegetacionAlta)"
                }
                if (fetchResults[0].porcentajeVegetacionBaja != 0){
                    PorcentajeVegBaja.text = "\(fetchResults[0].porcentajeVegetacionBaja)"
                }
                if (fetchResults[0].porcentajeVegetacionMedia != 0){
                    PorcentajeVegMedia.text = "\(fetchResults[0].porcentajeVegetacionMedia)"
                }
            
        }
    }
    
    
    func alert(title :String,mensaje: String){
        let alertController = UIAlertController(title: title, message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
