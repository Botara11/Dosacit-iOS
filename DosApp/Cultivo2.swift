//
//  Cultivo2.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 23/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class Cultivo2: UIViewController {
    
    var anotherString = String()
    var caract2 = ParteA()
    
    
    @IBOutlet var formaArbol: UISegmentedControl!
    @IBOutlet var fechaUltimaPoda: UISegmentedControl!
    @IBOutlet var gradoPoda: UISegmentedControl!
    
    
    
    @IBAction func formaArbol(sender: AnyObject) {
        
        
        if (formaArbol.selectedSegmentIndex == 0){
            caract2.formaArbol = 1;
            newItem.formaArbol = 1
            newItem.esfericoSeto = 0
            caract2.esfericoSeto = 0;
            println("densidad foliar : esferica")
        }
        else {
            caract2.formaArbol = 1;
            caract2.esfericoSeto = 1;
            newItem.formaArbol = 1
            newItem.esfericoSeto = 1
            println("densidad foliar : ")
        }
    }

    @IBAction func fechaUltimaPodaSelector(sender: AnyObject) {
        
          
        
        if (fechaUltimaPoda.selectedSegmentIndex == 0){
            newItem.fechaUltimaPoda = 0.95
            caract2.fechaUltimaPoda = 0.95;
        }
        else if (fechaUltimaPoda.selectedSegmentIndex == 1){
            newItem.fechaUltimaPoda = 1
            caract2.fechaUltimaPoda = 1;
            
        }
        else if(fechaUltimaPoda.selectedSegmentIndex == 2){
            newItem.fechaUltimaPoda = 1.075
            caract2.fechaUltimaPoda = 1.075;
            
        }
        else {
            newItem.fechaUltimaPoda = 1.15
            caract2.fechaUltimaPoda = 1.15;
            
        }
    }
    
    @IBAction func gradoPodaSelector(sender: AnyObject) {
        
        
        
        if (gradoPoda.selectedSegmentIndex == 0){
            caract2.gradoPoda = 0.95;
            newItem.gradoPoda = 0.95
        }
        if (gradoPoda.selectedSegmentIndex == 1){
            caract2.gradoPoda = 1;
            newItem.gradoPoda = 1
        }
        else {
            caract2.gradoPoda = 1.05;
            newItem.gradoPoda = 1.05
        }
    }
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
                
        if (segue.identifier == "Cultivo2"){
            
            var DestViewController : Cultivo3 = segue.destinationViewController as Cultivo3
            
            DestViewController.caract2 = caract2
        }
        
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if (newItem.esfericoSeto == 0){
            newItem.formaArbol = 1
            newItem.esfericoSeto = 0
            formaArbol.selectedSegmentIndex = 0
        }else if (newItem.esfericoSeto == 1){
            newItem.formaArbol = 1
            newItem.esfericoSeto = 1
            formaArbol.selectedSegmentIndex = 1
        }
        
        if (newItem.fechaUltimaPoda == 0){
            newItem.fechaUltimaPoda = 0.95
            fechaUltimaPoda.selectedSegmentIndex = 0
        }else if (newItem.fechaUltimaPoda == 0.95){
            newItem.fechaUltimaPoda = 0.95
            fechaUltimaPoda.selectedSegmentIndex = 0
        }else if (newItem.fechaUltimaPoda == 1){
            newItem.fechaUltimaPoda = 1
            fechaUltimaPoda.selectedSegmentIndex = 1
        }else if (newItem.fechaUltimaPoda == 1.075){
            fechaUltimaPoda.selectedSegmentIndex = 2
        }else if (newItem.fechaUltimaPoda == 1.15){
            fechaUltimaPoda.selectedSegmentIndex = 3
        }
        
        if(newItem.gradoPoda == 0){
            newItem.gradoPoda = 0.95
            gradoPoda.selectedSegmentIndex = 0
        }else if (newItem.gradoPoda == 0.95){
            newItem.gradoPoda = 0.95
            gradoPoda.selectedSegmentIndex = 0
        }else if (newItem.gradoPoda == 1){
            newItem.gradoPoda = 1
            gradoPoda.selectedSegmentIndex = 1
        }else if (newItem.gradoPoda == 1.05){
            newItem.gradoPoda = 1.05
            gradoPoda.selectedSegmentIndex = 2
        }
        
        
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
        
        
        println(fetchResults[0].anchoCalle)
            
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}