//
//  SelecBoquillas3.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 20/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

class SelecBoquillas3: UIViewController {
    
    var caract2 = ParteB()
    
    @IBOutlet var IntervaloCaudalAdmisibleAlta: UITextView!
    @IBOutlet var IntervaloCaudalAdmisibleMedia: UITextView!
    @IBOutlet var IntervaloCaudalAdmisibleBaja: UITextView!
    
    
    @IBOutlet var VariacionText: UITextView!
    @IBOutlet var VariacionCaudal: UISlider!
    
    @IBAction func SliderVariacionCaudal(sender: AnyObject) {
        
        var CurrentValue = Int(VariacionCaudal.value)
        VariacionText.text = "\(CurrentValue)"
        newItemB.variacionCaudalAdmisible = Double(CurrentValue)
        caract2.calcularParteB()
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
            IntervaloCaudalAdmisibleAlta.text = "\(fetchResults[0].intervaloCaudalAdmisible0)"
            IntervaloCaudalAdmisibleMedia.text = "\(fetchResults[0].intervaloCaudalAdmisible2)"
            IntervaloCaudalAdmisibleBaja.text = "\(fetchResults[0].intervaloCaudalAdmisible4)"
            
            
        }
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newItemB.variacionCaudalAdmisible = 5;
        caract2.calcularParteB()
        // Do any additional setup after loading the view, typically from a nib.
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            VariacionText.text = "\(fetchResults[0].variacionCaudalAdmisible)"
            IntervaloCaudalAdmisibleAlta.text = "\(fetchResults[0].intervaloCaudalAdmisible0)"
            IntervaloCaudalAdmisibleMedia.text = "\(fetchResults[0].intervaloCaudalAdmisible1)"
            IntervaloCaudalAdmisibleBaja.text = "\(fetchResults[0].intervaloCaudalAdmisible2)"
            
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}