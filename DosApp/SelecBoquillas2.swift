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
       
        /*newItemB.numeroBoquillasCerradas[0] = (NumBoqCerrAlta.text as NSString).integerValue
        newItemB.numeroBoquillasCerradas[1] = (NumBoqCerrBaja.text as NSString).integerValue
        newItemB.numeroBoquillasAbiertas[0] = (NumBoqAbAlta.text as NSString).integerValue
        newItemB.numeroBoquillasAbiertas[1] = (NumBoqAbMedia.text as NSString).integerValue
        newItemB.numeroBoquillasAbiertas[2] = (NumBoqAbBaja.text as NSString).integerValue
        newItemB.porcentajeVegetacion[0] = (PorcentajeVegAlta.text as NSString).integerValue
        newItemB.porcentajeVegetacion[1] = (PorcentajeVegMedia.text as NSString).integerValue
        newItemB.porcentajeVegetacion[2] = (PorcentajeVegBaja.text as NSString).integerValue*/

        
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
            
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
