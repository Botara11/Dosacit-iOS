//
//  File.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 23/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Cultivo3: UIViewController {
    
    var anotherString3 = String()
    var caract2 = ParteA()
    var productosAplicarIndice = 0;
    var formaActuacionIndice = 0;
    var zonaCriticaIndice = 0;
    
    @IBOutlet var productosAplicar: UISegmentedControl!
    @IBOutlet var formaActuacion: UISegmentedControl!
    @IBOutlet var utilizaCoadyuvantes: UISegmentedControl!
    @IBOutlet var copaArbol: UISegmentedControl!
    
    
    @IBAction func productosAplicarSelector(sender: AnyObject) {
        
        if (productosAplicar.selectedSegmentIndex == 0){
            newItem.productosAplicar = 1.05
            caract2.productosAplicar = 1.05;
        }
        else if (productosAplicar.selectedSegmentIndex == 1){
            caract2.productosAplicar = 1.05;
            newItem.productosAplicar = 1.05
        }
        else if (productosAplicar.selectedSegmentIndex == 2){
            caract2.productosAplicar = 1;
            newItem.productosAplicar = 1
        }
        else if (productosAplicar.selectedSegmentIndex == 3){
            caract2.productosAplicar = 0.95;
            newItem.productosAplicar = 0.95
        }
        else if (productosAplicar.selectedSegmentIndex == 4){
            caract2.productosAplicar = 0.95;
            newItem.productosAplicar = 0.95
        }
    }
    
   
    @IBAction func formaActuacionSelector(sender: AnyObject) {
        if (formaActuacion.selectedSegmentIndex == 0){
            caract2.formaActuacion = 1.05;
            newItem.formaActuacion = 1.05
        }
        else if (formaActuacion.selectedSegmentIndex == 1){
            caract2.formaActuacion = 1;
            newItem.formaActuacion = 1
        }
        else if (formaActuacion.selectedSegmentIndex == 2){
            caract2.formaActuacion = 1;
            newItem.formaActuacion = 1
        }
        else if (formaActuacion.selectedSegmentIndex == 3){
            caract2.formaActuacion = 1;
            newItem.formaActuacion = 1
        }
        else if (formaActuacion.selectedSegmentIndex == 4){
            caract2.formaActuacion = 0.95;
            newItem.formaActuacion = 0.95
        }
        else if (formaActuacion.selectedSegmentIndex == 5){
            caract2.formaActuacion = 0.85;
            newItem.formaActuacion = 0.85
        }
    }
    
    
    @IBAction func utilizaCoadyuvantesSelector(sender: AnyObject) {
        if (utilizaCoadyuvantes.selectedSegmentIndex == 0){
            caract2.mojantes = 1;
            newItem.mojantes = 1
        }
        else if (utilizaCoadyuvantes.selectedSegmentIndex == 1){
            caract2.mojantes = 1.05;
            newItem.mojantes = 1.05
        }
    }
    
    
    @IBAction func copaArbolSelector(sender: AnyObject) {
        if (copaArbol.selectedSegmentIndex == 0){
            caract2.zonaCriticaTratar = 3;
            newItem.zonaCritica = 3
        }
        else if (copaArbol.selectedSegmentIndex == 1){
            caract2.zonaCriticaTratar = 3;
            newItem.zonaCritica = 3
        }
        else {
            caract2.zonaCriticaTratar = 1;
            newItem.zonaCritica = 1
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        
            newItem.productosAplicarIndice = productosAplicar.selectedSegmentIndex
            
            newItem.formaActuacionIndice = formaActuacion.selectedSegmentIndex
            
            newItem.zonaCriticaIndice = copaArbol.selectedSegmentIndex
            
            
            var DestViewController : Cultivo4 = segue.destinationViewController as! Cultivo4
            DestViewController.caract2 =  caract2
            
            DestViewController.productosAplicarIndice =  productosAplicarIndice
            
            DestViewController.formaActuacionIndice = formaActuacionIndice
            
            DestViewController.zonaCriticaIndice = zonaCriticaIndice
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(anotherString3)
        
        
        
        
        
        
        if (newItem.productosAplicar == 0){
            productosAplicar.selectedSegmentIndex = 0
            newItem.productosAplicar = 1.05
        }else {
            productosAplicar.selectedSegmentIndex = newItem.productosAplicarIndice
        }
        
        if (newItem.formaActuacion == 0){
            formaActuacion.selectedSegmentIndex = 0
            newItem.formaActuacion = 1.15
        }else {
            formaActuacion.selectedSegmentIndex = newItem.formaActuacionIndice
        }
        
        if (newItem.zonaCritica == 0){
            newItem.zonaCriticaIndice = 0
            newItem.zonaCritica = 3
        }else {
            copaArbol.selectedSegmentIndex = newItem.zonaCriticaIndice
        }
        
        if (newItem.mojantes == 0){
           newItem.mojantes = 1
        }else if (newItem.mojantes == 1) {
            utilizaCoadyuvantes.selectedSegmentIndex = 0
        }else if (newItem.mojantes == 1.05) {
            utilizaCoadyuvantes.selectedSegmentIndex = 1
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}