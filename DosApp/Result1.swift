//
//  Result1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 3/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class Result1 : UIViewController {
    
    var caract2 = ParteA()
    var productosAplicarIndice = 0;
    var formaActuacionIndice = 0;
    var zonaCriticaIndice = 0;
    
    @IBOutlet var densidadFoliarText: UILabel!
    @IBOutlet var anchoCalleText: UILabel!
    @IBOutlet var distanciaArbolesText: UILabel!
    @IBOutlet var volumenArbolText: UILabel!
    @IBOutlet var formaArbolText: UILabel!
    @IBOutlet var fechaUltimaPodaText: UILabel!
    @IBOutlet var gradoPodaText: UILabel!
    @IBOutlet var productosAplicarText: UILabel!
    @IBOutlet var formaActuacionText: UILabel!
    @IBOutlet var mojantesText: UILabel!
    @IBOutlet var zonaCriticaText: UILabel!
    
    
    var LabelText = String ()
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        if (segue.identifier == "SegueResult12"){
            println(caract2.anchoCalle)
            var DestViewController : Result12 = segue.destinationViewController as! Result12
            
            DestViewController.caract2 =  caract2
            
            
            
            
        }
        
        
        
    }

    
     override func viewDidLoad() {
        
        
        
        
        
        
        
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
            
            if (fetchResults[0].anchuraArboles == 0){
                densidadFoliarText.backgroundColor = UIColor.grayColor();
                anchoCalleText.backgroundColor = UIColor.grayColor();
                distanciaArbolesText.backgroundColor = UIColor.grayColor();
                volumenArbolText.backgroundColor = UIColor.grayColor();
                formaArbolText.backgroundColor = UIColor.grayColor();
                fechaUltimaPodaText.backgroundColor = UIColor.grayColor();
                gradoPodaText.backgroundColor = UIColor.grayColor();
                productosAplicarText.backgroundColor = UIColor.grayColor();
                formaActuacionText.backgroundColor = UIColor.grayColor();
                mojantesText.backgroundColor = UIColor.grayColor();
                zonaCriticaText.backgroundColor = UIColor.grayColor();
                
            }
            else{
            //Densidad foliar
            if (fetchResults[0].densidadFoliar == 1.15){
                densidadFoliarText.text = "Alta"
            }
            else if (fetchResults[0].densidadFoliar == 1){
                densidadFoliarText.text = "Media"
            }
            else {
                densidadFoliarText.text = "Baja"
            }
            
            //Ancho Calle
            var b:String = String(format:"%.02f", fetchResults[0].anchoCalle)
            
            anchoCalleText.text = ("\(b) m")
            //anchoCalleText.text = "\(caract2.anchoCalle) m"
            
            //Distancia Árboles
            var c:String = String(format:"%.02f", fetchResults[0].distanciaArboles)
            distanciaArbolesText.text = ("\(c) m")
            
            
            //distanciaArbolesText.text = "\(caract2.distanciaArboles) m"
            
            //Volumen Árbol
            caract2.calcularVolumenArbol()
            var d:String = String(format:"%.02f", fetchResults[0].volumenArbol)
            volumenArbolText.text = ("\(d) m3")
            
            
            //Forma Árbol
            println(fetchResults[0].formaArbol)
            if (fetchResults[0].esfericoSeto == 0) {
                formaArbolText.text = "Esférica"
            }
            else{
                formaArbolText.text = "Seto"
            }
            
            //Fecha Última Poda
            if (fetchResults[0].fechaUltimaPoda == 0.95){
                fechaUltimaPodaText.text = "< 3 meses"
            }
            else if (fetchResults[0].fechaUltimaPoda == 1){
                fechaUltimaPodaText.text = "3 - 12 meses"
            }
            else if (fetchResults[0].fechaUltimaPoda == 1.075){
                fechaUltimaPodaText.text = "1 - 2 años"
            }
            else{
                fechaUltimaPodaText.text = "> 2 años"
            }
            
            // Grado Poda
            if (fetchResults[0].gradoPoda == 0.95){
                gradoPodaText.text = "Alto"
            }
            else if (fetchResults[0].gradoPoda == 1){
                gradoPodaText.text = "Medio"
            }
            else {
                gradoPodaText.text = "Bajo"
            }
            
            //Productos a aplicar
            if (fetchResults[0].productosAplicarIndice == 0){
                productosAplicarText.text = "Acaricidas"
            }
            else if (fetchResults[0].productosAplicarIndice == 1){
                productosAplicarText.text = "Fungicidas"
            }
            else if (fetchResults[0].productosAplicarIndice == 2){
                productosAplicarText.text = "Insecticidas"
            }
            else if (fetchResults[0].productosAplicarIndice == 3){
                productosAplicarText.text = "Abonos foliares"
            }
            else {
                productosAplicarText.text = "Fitorreguladores"
            }
            
            
            //Forma Actuación
            if (fetchResults[0].formaActuacionIndice == 0){
                formaActuacionText.text = "Por asfixia (aceite)"
            }
            else if (fetchResults[0].formaActuacionIndice == 1){
                formaActuacionText.text = "Por contacto"
            }
            else if (fetchResults[0].formaActuacionIndice == 2){
                formaActuacionText.text = "Por ingestión"
            }
            else if (fetchResults[0].formaActuacionIndice == 3){
                formaActuacionText.text = "Por inhalación"
            }
            else if (fetchResults[0].formaActuacionIndice == 4){
                formaActuacionText.text = "Traslaminar"
            }
            else {
                formaActuacionText.text = "Sistémicos"
            }
            
            
            //Mojantes
            if (fetchResults[0].mojantes == 1){
                mojantesText.text = "Sí"
            }
            else {
                mojantesText.text = "No"
            }
            
            
            //Zona crítica a tratar
            
            if (fetchResults[0].zonaCriticaIndice == 0){
                zonaCriticaText.text = "Interior"
            }
            else if (fetchResults[0].zonaCriticaIndice == 1){
                zonaCriticaText.text = "Interior y exterior"
            }
            if (fetchResults[0].zonaCriticaIndice == 2){
                zonaCriticaText.text = "Exterior"
            }
            }
            
            //let alert = UIAlertController(title: fetchResults[0].anchoCalle,
            //  message: "Hola",
            //preferredStyle: .Alert)
            //
            //self.presentViewController(alert,
            //  animated: true,
            //completion: nil)
            

            
        }
        
    }
    
}