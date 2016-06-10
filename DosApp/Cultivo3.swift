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
    var anotherString4 = String()
    var a = 0
    var b = 0
    var c = 0
    
    @IBOutlet var productosAplicar: UISegmentedControl!
    @IBOutlet weak var productosAplicar2: UISegmentedControl!
    @IBOutlet var formaActuacion: UISegmentedControl!
    @IBOutlet weak var formaActuacion2: UISegmentedControl!
    @IBOutlet var utilizaCoadyuvantes: UISegmentedControl!
    @IBOutlet var copaArbol: UISegmentedControl!
    
    
    @IBOutlet weak var temperatura: UISegmentedControl!
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
            newItemA!.temperatura = 1
            a = 0
        }
        else if (temperatura.selectedSegmentIndex == 1){
            caract2.temperatura = 1.025;
            newItemA!.temperatura = 1.025
            a = 1
        }
        else if (temperatura.selectedSegmentIndex == 2){
            caract2.temperatura = 1.05;
            newItemA!.temperatura = 1.05
            a = 2
        }
        else if (temperatura.selectedSegmentIndex == 3){
            alert("Advertencia",mensaje: "A más de 30º se recomienda no tratar")
            temperatura.selectedSegmentIndex = a
            //newItemA!.temperatura = 1
        }
    }
    
    @IBAction func humedadRelativaSelector(sender: AnyObject) {
        if (humedadRelativa.selectedSegmentIndex == 0){
            caract2.humedad = 1.05;
            newItemA!.humedadRelativa = 1.05
            b = 0
        }
        else if (humedadRelativa.selectedSegmentIndex == 1){
            caract2.humedad = 1;
            newItemA!.humedadRelativa = 1
            b = 1
        }
        else if (humedadRelativa.selectedSegmentIndex == 2){
            caract2.humedad = 0.97;
            newItemA!.humedadRelativa = 0.97
            b = 2
        }
        else if (humedadRelativa.selectedSegmentIndex == 3){
            alert("Advertencia",mensaje: "Se recomienda no tratar con lluvia")
            humedadRelativa.selectedSegmentIndex = b
            //newItemA!.humedadRelativa = 1.05
            
        }
    }
    
    
    @IBAction func velocidadVientoSelector(sender: AnyObject) {
        if (velocidadViento.selectedSegmentIndex == 0){
            caract2.velocidadViento = 1;
            newItemA!.velocidadViento = 1
            c = 0
        }
        else if(velocidadViento.selectedSegmentIndex == 1){
            caract2.velocidadViento = 1.05;
            newItemA!.velocidadViento = 1.05
            c = 1
        }
        else if(velocidadViento.selectedSegmentIndex == 2){
            alert("Advertencia",mensaje: "Se recomienda no tratar con una velocidad superior a 3 m/s")
            velocidadViento.selectedSegmentIndex = c
            //newItemA!.velocidadViento = 1
        }
        
    }
    
    
    @IBAction func tipoPulverizadorSelector(sender: AnyObject) {
        if (tipoPulverizador.selectedSegmentIndex == 0){
            caract2.tipoPulverizador = 1;
            newItemA!.tipoPulverizador = 1
        }
        else if (tipoPulverizador.selectedSegmentIndex == 1){
            caract2.tipoPulverizador = 1.8;
            newItemA!.tipoPulverizador = 1.8
        }
    }
    

    @IBAction func productosAplicarSelector(sender: AnyObject) {
        
        if (productosAplicar.selectedSegmentIndex == 0){
            newItemA!.productosAplicar = 1.05
            caract2.productosAplicar = 1.05;
        }
        else if (productosAplicar.selectedSegmentIndex == 1){
            caract2.productosAplicar = 1.05;
            newItemA!.productosAplicar = 1.05
        }
        else if (productosAplicar.selectedSegmentIndex == 2){
            caract2.productosAplicar = 1;
            newItemA!.productosAplicar = 1
        }
        
        productosAplicar2.selectedSegmentIndex = -1
        productosAplicar2.momentary = false
    }
    
    
    @IBAction func productosAplicarSelector2(sender: AnyObject) {
        
        if (productosAplicar.selectedSegmentIndex == 0){
            caract2.productosAplicar = 0.95;
            newItemA!.productosAplicar = 0.95
        }
        else if (productosAplicar.selectedSegmentIndex == 1){
            caract2.productosAplicar = 0.95;
            newItemA!.productosAplicar = 0.95
        }
        
        productosAplicar.selectedSegmentIndex = -1
        productosAplicar.momentary = false
        
    }
   
    @IBAction func formaActuacionSelector(sender: AnyObject) {
        if (formaActuacion.selectedSegmentIndex == 0){
            caract2.formaActuacion = 1.05;
            newItemA!.formaActuacion = 1.05
        }
        else if (formaActuacion.selectedSegmentIndex == 1){
            caract2.formaActuacion = 1;
            newItemA!.formaActuacion = 1
        }
        else if (formaActuacion.selectedSegmentIndex == 2){
            caract2.formaActuacion = 1;
            newItemA!.formaActuacion = 1
        }

        formaActuacion2.selectedSegmentIndex = -1
        formaActuacion2.momentary = false
        
        
    }
    
    @IBAction func formaActuacionSelector2(sender: AnyObject) {
        if (formaActuacion2.selectedSegmentIndex == 0){
            caract2.formaActuacion = 1;
            newItemA!.formaActuacion = 1
        }else if (formaActuacion2.selectedSegmentIndex == 1){
            caract2.formaActuacion = 0.95;
            newItemA!.formaActuacion = 0.95
        }
        else if (formaActuacion2.selectedSegmentIndex == 2){
            caract2.formaActuacion = 0.85;
            newItemA!.formaActuacion = 0.85
        }
        
        formaActuacion.selectedSegmentIndex = -1
        formaActuacion.momentary = false
        
    }
    
    @IBAction func utilizaCoadyuvantesSelector(sender: AnyObject) {
        if (utilizaCoadyuvantes.selectedSegmentIndex == 0){
            caract2.mojantes = 1;
            newItemA!.mojantes = 1
        }
        else if (utilizaCoadyuvantes.selectedSegmentIndex == 1){
            caract2.mojantes = 1.05;
            newItemA!.mojantes = 1.05
        }
    }
    
    
    @IBAction func copaArbolSelector(sender: AnyObject) {
        if (copaArbol.selectedSegmentIndex == 0){
            caract2.zonaCriticaTratar = 3;
            newItemA!.zonaCritica = 3
        }
        else if (copaArbol.selectedSegmentIndex == 1){
            caract2.zonaCriticaTratar = 3;
            newItemA!.zonaCritica = 3
        }
        else {
            caract2.zonaCriticaTratar = 1;
            newItemA!.zonaCritica = 1
        }
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(productosAplicar.selectedSegmentIndex == -1){
            newItemA!.productosAplicarIndice = productosAplicar2.selectedSegmentIndex+10
        }else{
        newItemA!.productosAplicarIndice = productosAplicar.selectedSegmentIndex
        }
        if(formaActuacion.selectedSegmentIndex == -1){
            newItemA!.formaActuacionIndice = formaActuacion2.selectedSegmentIndex+10
        }else{
        newItemA!.formaActuacionIndice = formaActuacion.selectedSegmentIndex
        }
        newItemA!.zonaCriticaIndice = copaArbol.selectedSegmentIndex
        
        newItemA!.zonaCriticaIndice = copaArbol.selectedSegmentIndex
        
        do {
            try managedObjectContext!.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest2 = NSFetchRequest(entityName: "A1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest2)) as? [A1] {
            print("Cultivo3 Objetos: \(fetchResults.count)")
            newItemA! = fetchResults[0]
        }
        
        print("\(newItemA!.productosAplicarIndice) y \(newItemA!.formaActuacionIndice)")
        
        if (newItemA!.productosAplicar % 10 == 0){
            
            if (newItemA!.productosAplicar == 0){
                productosAplicar.selectedSegmentIndex = 0
                newItemA!.productosAplicar = 1.05
            }else {
                productosAplicar.selectedSegmentIndex = newItemA!.productosAplicarIndice
            }
            productosAplicar2.selectedSegmentIndex = -1
            productosAplicar2.momentary = false
        }else{
            productosAplicar2.selectedSegmentIndex = newItemA!.productosAplicarIndice-10
            print("seleccionar: \(newItemA!.productosAplicarIndice-10)")
            productosAplicar.selectedSegmentIndex = -1
            productosAplicar.momentary = false
        }
        
        if (newItemA!.formaActuacion % 10 == 0){
            if (newItemA!.formaActuacion == 0){
                formaActuacion.selectedSegmentIndex = 0
                newItemA!.formaActuacion = 1.15
            }else {
                formaActuacion.selectedSegmentIndex = newItemA!.formaActuacionIndice
            }
            formaActuacion2.selectedSegmentIndex = -1
            formaActuacion2.momentary = false
        }else{
            formaActuacion2.selectedSegmentIndex = newItemA!.formaActuacionIndice - 10
            print("seleccionarforma: \(newItemA!.formaActuacionIndice-10)")
            formaActuacion.selectedSegmentIndex = -1
            formaActuacion.momentary = false
        }
        if (newItemA!.zonaCritica == 0){
            newItemA!.zonaCriticaIndice = 0
            newItemA!.zonaCritica = 3
        }else {
            copaArbol.selectedSegmentIndex = newItemA!.zonaCriticaIndice
        }
        
        
        if (newItemA!.temperatura == 0){
            newItemA!.temperatura = 1
        }else if (newItemA!.temperatura == 1){
            temperatura.selectedSegmentIndex = 0
        }else if (newItemA!.temperatura == 1.025){
            temperatura.selectedSegmentIndex = 1
        }else if (newItemA!.temperatura == 1.05){
            temperatura.selectedSegmentIndex = 2
        }
        
        if (newItemA!.humedadRelativa == 0){
            newItemA!.humedadRelativa = 1.05
        }else if(newItemA!.humedadRelativa == 1.05){
            humedadRelativa.selectedSegmentIndex = 0
        }else if(newItemA!.humedadRelativa == 1){
            humedadRelativa.selectedSegmentIndex = 1
        }else if(newItemA!.humedadRelativa == 0.97){
            humedadRelativa.selectedSegmentIndex = 2
        }
        
        if (newItemA!.velocidadViento == 0){
            newItemA!.velocidadViento = 1
        }else if (newItemA!.velocidadViento == 1){
            velocidadViento.selectedSegmentIndex = 0
        }else if (newItemA!.velocidadViento == 1.05){
            velocidadViento.selectedSegmentIndex = 1
        }
        
        
        if (newItemA!.tipoPulverizador == 0){
            newItemA!.tipoPulverizador = 1
            
            let fetchRequest = NSFetchRequest(entityName: "A1")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [A1] {
                
                print("Pulverizador ******* \(fetchResults[0].tipoPulverizador)")
            }
        }else if (newItemA!.tipoPulverizador == 1){
            tipoPulverizador.selectedSegmentIndex = 0
        }else if (newItemA!.tipoPulverizador == 1.8){
            tipoPulverizador.selectedSegmentIndex = 1
        }
        
        print("Indice: \(newItemA!.productosAplicarIndice)")
        
        if (newItemA!.productosAplicar == 0){
            productosAplicar.selectedSegmentIndex = 0
            newItemA!.productosAplicar = 1.05
        }else {
            productosAplicar.selectedSegmentIndex = newItemA!.productosAplicarIndice
        }
        
        if (newItemA!.formaActuacion == 0){
            formaActuacion.selectedSegmentIndex = 0
            newItemA!.formaActuacion = 1.15
        }else {
            formaActuacion.selectedSegmentIndex = newItemA!.formaActuacionIndice
        }
        
        if (newItemA!.zonaCritica == 0){
            newItemA!.zonaCriticaIndice = 0
            newItemA!.zonaCritica = 3
        }else {
            copaArbol.selectedSegmentIndex = newItemA!.zonaCriticaIndice
        }
        
        if (newItemA!.mojantes == 0){
           newItemA!.mojantes = 1
        }else if (newItemA!.mojantes == 1) {
            utilizaCoadyuvantes.selectedSegmentIndex = 0
        }else if (newItemA!.mojantes == 1.05) {
            utilizaCoadyuvantes.selectedSegmentIndex = 1
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}