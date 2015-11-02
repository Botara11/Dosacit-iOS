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
    
    
    @IBAction func PDFgeneratoraction(sender: AnyObject) {
        
        let pageSize:CGSize = CGSizeMake (850, 1100)
        let fileName: NSString = "xp.pdf"
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
        }
        else if (fetchResults[0].temperatura == 1.025){
            temperaturaText.text = "De 15 a 25 ºC"
        }
        else {
            temperaturaText.text = "De 25 a 30 ºC"
        }
        
        
        //Humedad Relativa
        if (fetchResults[0].humedadRelativa == 1.05){
            humedadRelativaText.text = "< 35% (muy seco)"
        }
        else if (fetchResults[0].humedadRelativa == 1){
            humedadRelativaText.text = "35-60% (normal)"
        }
        else {
            humedadRelativaText.text = "> 60% (muy húmedo)"
        }
        
        
        
        //Velocidad del viento
        if (fetchResults[0].velocidadViento == 1){
            velocidadVientoText.text = "< 1m/s (sin viento)"
        }
        else {
            velocidadVientoText.text = "1-3 m/s (brisa suave)"
        }
        
        println("Pulverizador ******* \(fetchResults[0].tipoPulverizador)")
        
        //Tipo de pulverizador
        if (fetchResults[0].tipoPulverizador == 1){
            tipoPulverizadorText.text = "Pulv. hidroneumático"
        }
        else {
            tipoPulverizadorText.text = "Pistola"
        }
        
        //Volumen de aplicación
        caract2.volumenDeAplicacion()
        
        volumenAplicacionHAText.text = "\(fetchResults[0].volumenAplicacionLHA) L/HA"
        volumenAplicacionHGText.text = "\(fetchResults[0].volumenAplicacionLHG) L/HG"

        }
        }

    }
    
    func generatePDFs(filePath: String) {
        UIGraphicsBeginPDFContextToFile(filePath, CGRectZero, nil)
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1100), nil)
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
        let font:UIFont = UIFont (name: "Times New Roman", size: 14)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        let textRect:CGRect = CGRectMake(10, 10, 100, 20)
        let baselineAdjust = 1.0
        let attrsDictionary =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust] as [NSObject : AnyObject]
        let myString:NSString = "Azúcar Álvaro"
        myString.drawInRect(textRect, withAttributes: attrsDictionary)
        
    }
    
    
}