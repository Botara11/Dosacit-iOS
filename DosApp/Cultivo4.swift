//
//  Cultivo4.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 23/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Cultivo4: UIViewController {
    
    var anotherString4 = String()
    var caract2 = ParteA()
    var productosAplicarIndice = 0;
    var formaActuacionIndice = 0;
    var zonaCriticaIndice = 0;
    var a = 0
    var b = 0
    var c = 0
    
    @IBOutlet var temperatura: UISegmentedControl!
    @IBOutlet var humedadRelativa: UISegmentedControl!
    @IBOutlet var velocidadViento: UISegmentedControl!
    @IBOutlet var tipoPulverizador: UISegmentedControl!
    
    
    func alert(title :String,mensaje: String){
        let alertController = UIAlertController(title: title, message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func temperaturaSelector(sender: AnyObject) {
        if (temperatura.selectedSegmentIndex == 0){
            caract2.temperatura = 1;
            newItem.temperatura = 1
            a = 0
        }
        else if (temperatura.selectedSegmentIndex == 1){
            caract2.temperatura = 1.025;
            newItem.temperatura = 1.025
            a = 1
        }
        else if (temperatura.selectedSegmentIndex == 2){
            caract2.temperatura = 1.05;
            newItem.temperatura = 1.05
            a = 2
        }
        else if (temperatura.selectedSegmentIndex == 3){
            alert("Advertencia",mensaje: "A más de 30º se recomienda no tratar")
            temperatura.selectedSegmentIndex = a
            //newItem.temperatura = 1
        }
    }
    
    @IBAction func humedadRelativaSelector(sender: AnyObject) {
        if (humedadRelativa.selectedSegmentIndex == 0){
            caract2.humedad = 1.05;
            newItem.humedadRelativa = 1.05
            b = 0
        }
        else if (humedadRelativa.selectedSegmentIndex == 1){
            caract2.humedad = 1;
            newItem.humedadRelativa = 1
            b = 1
        }
        else if (humedadRelativa.selectedSegmentIndex == 2){
            caract2.humedad = 0.97;
            newItem.humedadRelativa = 0.97
            b = 2
        }
        else if (humedadRelativa.selectedSegmentIndex == 3){
            alert("Advertencia",mensaje: "Se recomienda no tratar con lluvia")
            humedadRelativa.selectedSegmentIndex = b
            //newItem.humedadRelativa = 1.05

        }
    }
    
    
    @IBAction func velocidadVientoSelector(sender: AnyObject) {
        if (velocidadViento.selectedSegmentIndex == 0){
            caract2.velocidadViento = 1;
            newItem.velocidadViento = 1
            c = 0
        }
        else if(velocidadViento.selectedSegmentIndex == 1){
            caract2.velocidadViento = 1.05;
            newItem.velocidadViento = 1.05
            c = 1
        }
        else if(velocidadViento.selectedSegmentIndex == 2){
            alert("Advertencia",mensaje: "Se recomienda no tratar con una velocidad superior a 3 m/s")
            velocidadViento.selectedSegmentIndex = c
            //newItem.velocidadViento = 1
        }
        
    }
    
    
    @IBAction func tipoPulverizadorSelector(sender: AnyObject) {
        if (tipoPulverizador.selectedSegmentIndex == 0){
            caract2.tipoPulverizador = 1;
            newItem.tipoPulverizador = 1
        }
        else if (tipoPulverizador.selectedSegmentIndex == 1){
            caract2.tipoPulverizador = 1.8;
            newItem.tipoPulverizador = 1.8
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        if (segue.identifier == "SegueResult1"){
            println(caract2.anchoCalle)
            var DestViewController : Result1 = segue.destinationViewController as! Result1
            
            var stringValue = "\(caract2.anchoCalle)"
            
            DestViewController.caract2 =  caract2
            
            DestViewController.productosAplicarIndice =  productosAplicarIndice
            
            DestViewController.formaActuacionIndice = formaActuacionIndice
            
            DestViewController.zonaCriticaIndice = zonaCriticaIndice
            
            
        }
        
        
        
    }

    
    
       override func viewDidLoad() {
        super.viewDidLoad()
        println(anotherString4)
        
        if (newItem.temperatura == 0){
            newItem.temperatura = 1
        }else if (newItem.temperatura == 1){
            temperatura.selectedSegmentIndex = 0
        }else if (newItem.temperatura == 1.025){
            temperatura.selectedSegmentIndex = 1
        }else if (newItem.temperatura == 1.05){
            temperatura.selectedSegmentIndex = 2
        }
        
        if (newItem.humedadRelativa == 0){
            newItem.humedadRelativa = 1.05
        }else if(newItem.humedadRelativa == 1.05){
            humedadRelativa.selectedSegmentIndex = 0
        }else if(newItem.humedadRelativa == 1){
            humedadRelativa.selectedSegmentIndex = 1
        }else if(newItem.humedadRelativa == 0.97){
            humedadRelativa.selectedSegmentIndex = 2
        }
        
        if (newItem.velocidadViento == 0){
            newItem.velocidadViento = 1
        }else if (newItem.velocidadViento == 1){
            velocidadViento.selectedSegmentIndex = 0
        }else if (newItem.velocidadViento == 1.05){
            velocidadViento.selectedSegmentIndex = 1
        }
        
        
        if (newItem.tipoPulverizador == 0){
            newItem.tipoPulverizador = 1
            
            let fetchRequest = NSFetchRequest(entityName: "A1")
            if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
                
            println("Pulverizador ******* \(fetchResults[0].tipoPulverizador)")
            }
        }else if (newItem.tipoPulverizador == 1){
            tipoPulverizador.selectedSegmentIndex = 0
        }else if (newItem.tipoPulverizador == 1.8){
            tipoPulverizador.selectedSegmentIndex = 1
        }

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}