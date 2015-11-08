//
//  SelecBoquillas2.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 14/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

class SelecBoquillas2: ResponsiveTextFieldViewController {
    
   
    @IBOutlet var NumBoqCerrAlta: UITextField!
    @IBOutlet var NumBoqCerrBaja: UITextField!
    @IBOutlet var NumBoqAbAlta: UITextField!
    @IBOutlet var NumBoqAbMedia: UITextField!
    @IBOutlet var NumBoqAbBaja: UITextField!
    @IBOutlet var PorcentajeVegAlta: UITextField!
    @IBOutlet var PorcentajeVegMedia: UITextField!
    @IBOutlet var PorcentajeVegBaja: UITextField!
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
        
        if(segue.identifier == "B23"){
        
        
            if NumBoqCerrAlta.text == "" || NumBoqCerrBaja.text == "" || NumBoqAbAlta.text == "" || NumBoqAbBaja.text == "" || NumBoqAbMedia.text == "" || PorcentajeVegAlta.text == "" || PorcentajeVegBaja == "" || PorcentajeVegMedia.text == "" {
            
            alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
            
            }else if (((PorcentajeVegAlta.text as NSString).integerValue) + (PorcentajeVegMedia.text as NSString).integerValue + (PorcentajeVegBaja.text as NSString).integerValue != 100 ){
            
            alert("ERROR",mensaje: "La suma del porcentaje de vegetación a pulverizar no es igual al 100%")
            }else if(((NumBoqAbAlta.text as NSString).integerValue + (NumBoqAbMedia.text as NSString).integerValue + (NumBoqAbBaja.text as NSString).integerValue + (NumBoqCerrAlta.text as NSString).integerValue + (NumBoqCerrBaja.text as NSString).integerValue) != fetchResults[0].numeroTotalBoquillas ){
            
                alert("ERROR",mensaje: "La suma entre las boquillas abiertas y cerradas debe ser igual al número total de boquillas")
                
            }else{
       
                newItemB.numeroBoquillasCerradasAlta = (NumBoqCerrAlta.text as NSString).integerValue
        
                newItemB.numeroBoquillasCerradasBaja = (NumBoqCerrBaja.text as NSString).integerValue
        
                newItemB.numeroBoquillasAbiertasAlta = (NumBoqAbAlta.text as NSString).integerValue
        
                newItemB.numeroBoquillasAbiertasMedia = (NumBoqAbMedia.text as NSString).integerValue
        
                newItemB.numeroBoquillasAbiertasBaja = (NumBoqAbBaja.text as NSString).integerValue
        
                newItemB.porcentajeVegetacionAlta = (PorcentajeVegAlta.text as NSString).integerValue
        
                newItemB.porcentajeVegetacionMedia = (PorcentajeVegMedia.text as NSString).integerValue
        
                newItemB.porcentajeVegetacionBaja = (PorcentajeVegBaja.text as NSString).integerValue
            }
        }
        newItemB.numeroBoquillasCerradasAlta = (NumBoqCerrAlta.text as NSString).integerValue
        
        newItemB.numeroBoquillasCerradasBaja = (NumBoqCerrBaja.text as NSString).integerValue
        
        newItemB.numeroBoquillasAbiertasAlta = (NumBoqAbAlta.text as NSString).integerValue
        
        newItemB.numeroBoquillasAbiertasMedia = (NumBoqAbMedia.text as NSString).integerValue
        
        newItemB.numeroBoquillasAbiertasBaja = (NumBoqAbBaja.text as NSString).integerValue
        
        newItemB.porcentajeVegetacionAlta = (PorcentajeVegAlta.text as NSString).integerValue
        
        newItemB.porcentajeVegetacionMedia = (PorcentajeVegMedia.text as NSString).integerValue
        
        newItemB.porcentajeVegetacionBaja = (PorcentajeVegBaja.text as NSString).integerValue
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NumBoqCerrAlta.keyboardType = UIKeyboardType.NumbersAndPunctuation
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
