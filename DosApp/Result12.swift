//
//  Result12.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 25/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class Result12 : UIViewController {
    
    var caract2 = ParteA()
    
    
    @IBOutlet var temperaturaText: UILabel!
    @IBOutlet var humedadRelativaText: UILabel!
    @IBOutlet var velocidadVientoText: UILabel!
    @IBOutlet var tipoPulverizadorText: UILabel!
    @IBOutlet var volumenAplicacionHAText: UILabel!
    @IBOutlet var volumenAplicacionHGText: UILabel!
    
    var temperaturaTextA: String!
    var humedadRelativaTextA: String!
    var velocidadVientoTextA: String!
    var tipoPulverizadorTextA: String!
    var volumenAplicacionHATextA: String!
    
    var densidadFoliarText: String!
    var anchoCalleText: String!
    var distanciaArbolesText: String!
    var volumenArbolText: String!
    var formaArbolText: String!
    var fechaUltimaPodaText: String!
    var gradoPodaText: String!
    var productosAplicarText: String!
    var formaActuacionText: String!
    var mojantesText: String!
    var zonaCriticaText: String!
    
    var fechaText: String!
    var idParcelaText: String!
    var idTratamientoText: String!
    var referenciaText: String!
    
    
    
    @IBAction func PDFgeneratoraction(sender: AnyObject) {
        
        let pageSize:CGSize = CGSizeMake (850, 1100)
        let fileName: NSString = "Dosacítric.pdf"
        let path:NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory: AnyObject = path.objectAtIndex(0)
        let pdfPathWithFileName = documentDirectory.stringByAppendingPathComponent(fileName as String)
        
        generatePDFs(pdfPathWithFileName)

    }
    
    override func viewDidLoad() {
        
       
        
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
            
          
            
        if (fetchResults[0].anchuraArboles==0){
            temperaturaText.backgroundColor = UIColor.grayColor();
            humedadRelativaText.backgroundColor = UIColor.grayColor();
            velocidadVientoText.backgroundColor = UIColor.grayColor();
            tipoPulverizadorText.backgroundColor = UIColor.grayColor();
            volumenAplicacionHAText.backgroundColor = UIColor.grayColor();
            volumenAplicacionHGText.backgroundColor = UIColor.grayColor();
            
        }else{
        
        //Temperatura
        if (fetchResults[0].temperatura == 1){
            temperaturaText.text = "< 15 ºC"
            temperaturaTextA = "< 15 ºC"
        }
        else if (fetchResults[0].temperatura == 1.025){
            temperaturaText.text = "De 15 a 25 ºC"
            temperaturaTextA = "De 15 a 25 ºC"
        }
        else {
            temperaturaText.text = "De 25 a 30 ºC"
            temperaturaTextA = "De 25 a 30 ºC"
        }
        
        
        //Humedad Relativa
        if (fetchResults[0].humedadRelativa == 1.05){
            humedadRelativaText.text = "< 35% (muy seco)"
            humedadRelativaTextA = "< 35% (muy seco)"
        }
        else if (fetchResults[0].humedadRelativa == 1){
            humedadRelativaText.text = "35-60% (normal)"
            humedadRelativaTextA = "35-60% (normal)"
        }
        else {
            humedadRelativaText.text = "> 60% (muy húmedo)"
            humedadRelativaTextA = "> 60% (muy húmedo)"
        }
        
        
        
        //Velocidad del viento
        if (fetchResults[0].velocidadViento == 1){
            velocidadVientoText.text = "< 1m/s (sin viento)"
            velocidadVientoTextA = "< 1m/s (sin viento)"
        }
        else {
            velocidadVientoText.text = "1-3 m/s (brisa suave)"
            velocidadVientoTextA = "1-3 m/s (brisa suave)"
        }
        
        println("Pulverizador ******* \(fetchResults[0].tipoPulverizador)")
        
        //Tipo de pulverizador
        if (fetchResults[0].tipoPulverizador == 1){
            tipoPulverizadorText.text = "Pulv. hidroneumático"
            tipoPulverizadorTextA = "Pulv. hidroneumático"
        }
        else {
            tipoPulverizadorText.text = "Pistola"
            tipoPulverizadorTextA = "Pulv. hidroneumático"
        }
        
        //Volumen de aplicación
        caract2.volumenDeAplicacion()
        
        volumenAplicacionHAText.text = "\(fetchResults[0].volumenAplicacionLHA) L/HA"
        volumenAplicacionHATextA = "\(fetchResults[0].volumenAplicacionLHA) L/HA"
        volumenAplicacionHGText.text = "\(fetchResults[0].volumenAplicacionLHG) L/HG"

        }
        
            if (fetchResults[0].densidadFoliar == 1.15){
                densidadFoliarText = "Alta"
            }
            else if (fetchResults[0].densidadFoliar == 1){
                densidadFoliarText = "Media"
            }
            else {
                densidadFoliarText = "Baja"
            }
            
            //Ancho Calle
            var b:String = String(format:"%.02f", fetchResults[0].anchoCalle)
            
            anchoCalleText = ("\(b) m")
            //anchoCalleText.text = "\(caract2.anchoCalle) m"
            
            //Distancia Árboles
            var c:String = String(format:"%.02f", fetchResults[0].distanciaArboles)
            distanciaArbolesText = ("\(c) m")
            
            
            //distanciaArbolesText.text = "\(caract2.distanciaArboles) m"
            
            //Volumen Árbol
            caract2.calcularVolumenArbol()
            var d:String = String(format:"%.02f", fetchResults[0].volumenArbol)
            volumenArbolText = ("\(d) m3")
            
            
            //Forma Árbol
            println(fetchResults[0].formaArbol)
            if (fetchResults[0].esfericoSeto == 0) {
                formaArbolText = "Esférica"
            }
            else{
                formaArbolText = "Seto"
            }
            
            //Fecha Última Poda
            if (fetchResults[0].fechaUltimaPoda == 0.95){
                fechaUltimaPodaText = "< 3 meses"
            }
            else if (fetchResults[0].fechaUltimaPoda == 1){
                fechaUltimaPodaText = "3 - 12 meses"
            }
            else if (fetchResults[0].fechaUltimaPoda == 1.075){
                fechaUltimaPodaText = "1 - 2 años"
            }
            else{
                fechaUltimaPodaText = "> 2 años"
            }
            
            // Grado Poda
            if (fetchResults[0].gradoPoda == 0.95){
                gradoPodaText = "Grado de poda: Alto"
            }
            else if (fetchResults[0].gradoPoda == 1){
                gradoPodaText = "Grado de poda: Medio"
            }
            else {
                gradoPodaText = "Grado de poda: Bajo"
            }
            
            //Productos a aplicar
            if (fetchResults[0].productosAplicarIndice == 0){
                productosAplicarText = "Acaricidas"
            }
            else if (fetchResults[0].productosAplicarIndice == 1){
                productosAplicarText = "Fungicidas"
            }
            else if (fetchResults[0].productosAplicarIndice == 2){
                productosAplicarText = "Insecticidas"
            }
            else if (fetchResults[0].productosAplicarIndice == 3){
                productosAplicarText = "Abonos foliares"
            }
            else {
                productosAplicarText = "Fitorreguladores"
            }
            
            
            //Forma Actuación
            if (fetchResults[0].formaActuacionIndice == 0){
                formaActuacionText = "Por asfixia (aceite)"
            }
            else if (fetchResults[0].formaActuacionIndice == 1){
                formaActuacionText = "Por contacto"
            }
            else if (fetchResults[0].formaActuacionIndice == 2){
                formaActuacionText = "Por ingestión"
            }
            else if (fetchResults[0].formaActuacionIndice == 3){
                formaActuacionText = "Por inhalación"
            }
            else if (fetchResults[0].formaActuacionIndice == 4){
                formaActuacionText = "Traslaminar"
            }
            else {
                formaActuacionText = "Sistémicos"
            }
            
            
            //Mojantes
            if (fetchResults[0].mojantes == 1){
                mojantesText = "Sí"
            }
            else {
                mojantesText = "No"
            }
            
            
            //Zona crítica a tratar
            
            if (fetchResults[0].zonaCriticaIndice == 0){
                zonaCriticaText = "Interior"
            }
            else if (fetchResults[0].zonaCriticaIndice == 1){
                zonaCriticaText = "Interior y exterior"
            }
            if (fetchResults[0].zonaCriticaIndice == 2){
                zonaCriticaText = "Exterior"
            }
        

    }
        
        
        let fetchRequestZ = NSFetchRequest(entityName: "Z1")
        if let fetchResultsZ = managedObjectContext!.executeFetchRequest(fetchRequestZ, error: nil) as? [Z1] {
            
            fechaText = "Fecha: \(fetchResultsZ[0].fecha)"
            idParcelaText = "Identificación de la parcela: \(fetchResultsZ[0].idParcela)"
            idTratamientoText = "Identificación del tratamiento: \(fetchResultsZ[0].idTratamiento)"
            referenciaText = "Referencia: \(fetchResultsZ[0].referencia)"
            
        }
        
        
}
    
    func generatePDFs(filePath: String) {
        UIGraphicsBeginPDFContextToFile(filePath, CGRectZero, nil)
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1200), nil)
        drawBackground()
        drawText()
        println("PDF creado!")
        UIGraphicsEndPDFContext()
        
        
        
    }
    
    func drawBackground(){
        
        println("back creado!")
        let context:CGContextRef = UIGraphicsGetCurrentContext()
        let rect:CGRect = CGRectMake(0, 0, 850, 1100)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, rect)
        
        
        
    }
    
   
    
    func drawText(){
        
        println("back creado!")
        let context:CGContextRef = UIGraphicsGetCurrentContext()
        var font:UIFont = UIFont (name: "Times New Roman", size: 18)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        var y = 170;
        var textRect:CGRect = CGRectMake(10, 10, 300, 20)
        let baselineAdjust = 1.0
        let attrsDictionary =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        println(idTratamientoText)
        for i in 0...3{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = [fechaText, idParcelaText, idTratamientoText, referenciaText, gradoPodaText];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            PDFarray[i]!.drawInRect(textRect, withAttributes: attrsDictionary)
        }

        y = 410;
        
        for i in 0...5{
        textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = ["Densidad foliar del árbol: \(densidadFoliarText)", "Marco de plantación de \(anchoCalleText) x \(distanciaArbolesText)", "Volumen del árbol: \(volumenArbolText)","Forma del árbol: \(formaArbolText)", "Fecha de la última poda: \(fechaUltimaPodaText)", gradoPodaText];
        // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
        y=y+30;
       // let myString:NSString = "Azúcar Álvaro"
        PDFarray[i]!.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = 640;
        
        for i in 0...3{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(350), CGFloat(20))
            var PDFarray = ["Productos a aplicar: \(productosAplicarText)", "Forma de actuación: \(formaActuacionText)", "¿Utiliza coadyuvantes? \(mojantesText)", "Zona crítica a tratar: \(zonaCriticaText)", gradoPodaText];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            PDFarray[i]!.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = 810;
        
        for i in 0...2{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(350), CGFloat(20))
            var PDFarray = ["Temperatura: \(temperaturaTextA)", "Humedad relativa: \(humedadRelativaTextA)", "Velocidad del viento: \(velocidadVientoTextA)", gradoPodaText];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            PDFarray[i]!.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = 950;
        
        
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(350), CGFloat(20))
            var PDFarray = ["Tipo de pulverizador: \(tipoPulverizadorTextA)"];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            PDFarray[0].drawInRect(textRect, withAttributes: attrsDictionary)
        
        y = 1040;
        
        
        textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(400), CGFloat(20))
        var PDFarrayV = ["Volumen de aplicación calculado: \(volumenAplicacionHATextA)"];
        // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
        y=y+30;
        // let myString:NSString = "Azúcar Álvaro"
        PDFarrayV[0].drawInRect(textRect, withAttributes: attrsDictionary)
        
        
        font = UIFont (name: "Times New Roman", size: 60)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        var tituloArray = "DOSACÍTRIC"
        textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
        tituloArray.drawInRect(textRect, withAttributes: attrsTitulo)
        
        font = UIFont (name: "Times New Roman", size: 40)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsA =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        var AArray = "A. IDENTIFICACIÓN DEL TRATAMIENTO"
        textRect = CGRectMake(CGFloat(40), CGFloat(110), CGFloat(800), CGFloat(90))
        AArray.drawInRect(textRect, withAttributes: attrsA)
        
        font = UIFont (name: "Times New Roman", size: 40)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        var BArray = "B. VOLUMEN DE APLICACIÓN"
        textRect = CGRectMake(CGFloat(40), CGFloat(320), CGFloat(800), CGFloat(90))
        BArray.drawInRect(textRect, withAttributes: attrsB)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB1 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        var B1Array = "B.1. Características del cultivo"
        textRect = CGRectMake(CGFloat(80), CGFloat(370), CGFloat(800), CGFloat(90))
        B1Array.drawInRect(textRect, withAttributes: attrsB1)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB2 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        var B2Array = "B.2. Tipo de tratamiento"
        textRect = CGRectMake(CGFloat(80), CGFloat(600), CGFloat(800), CGFloat(90))
        B2Array.drawInRect(textRect, withAttributes: attrsB2)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB3 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        var B3Array = "B.3. Condiciones meteorológicas"
        textRect = CGRectMake(CGFloat(80), CGFloat(770), CGFloat(800), CGFloat(90))
        B3Array.drawInRect(textRect, withAttributes: attrsB3)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB4 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        var B4Array = "B.4. Equipo empleado"
        textRect = CGRectMake(CGFloat(80), CGFloat(910), CGFloat(800), CGFloat(90))
        B4Array.drawInRect(textRect, withAttributes: attrsB4)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB5 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        var B5Array = "B.5. Volumen de aplicación"
        textRect = CGRectMake(CGFloat(80), CGFloat(1000), CGFloat(800), CGFloat(90))
        B5Array.drawInRect(textRect, withAttributes: attrsB5)

        
        
    }
    
    
}