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


class Result2CR : UIViewController {
    
    var caract2 = ParteB()
    var productosAplicarIndice = 0;
    var formaActuacionIndice = 0;
    var zonaCriticaIndice = 0;
    
    @IBOutlet weak var volumenAplicacion: UILabel!
    @IBOutlet weak var velocidadAvance: UILabel!
    @IBOutlet weak var anchoTrabajo: UILabel!
    @IBOutlet weak var caudalLiqTotal: UILabel!
    @IBOutlet weak var numBoquillasTotal: UILabel!
    @IBOutlet weak var numBoquillasPorSector: UILabel!
    @IBOutlet weak var boquillasCerrarZonaAlta: UILabel!
    @IBOutlet weak var boquillasCerrarZonaBaja: UILabel!
    @IBOutlet weak var NumBoquillasZonaAlta: UILabel!
    @IBOutlet weak var NumBoquillasZonaMedia: UILabel!
    @IBOutlet weak var NumBoquillasZonaBaja: UILabel!
    @IBOutlet weak var vegetacionZonaAlta: UILabel!
    @IBOutlet weak var vegetacionZonaMedia: UILabel!
    @IBOutlet weak var vegetacionZonaBaja: UILabel!
    @IBOutlet weak var caudalLiquidoSector: UILabel!
    @IBOutlet weak var variacionCaudalAdmisible: UILabel!
    @IBOutlet weak var caudalLiquidoZonaAlta: UILabel!
    @IBOutlet weak var caudalLiquidoZonaMedia: UILabel!
    @IBOutlet weak var caudalLiquidoZonaBaja: UILabel!
  
    
    
    var LabelText = String ()
    var temperaturaTextA: String!
    var humedadRelativaTextA: String!
    var velocidadVientoTextA: String!
    var tipoPulverizadorTextA: String!
    var volumenAplicacionHATextA: String!
    
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
        print(pdfPathWithFileName)
        
        generatePDFs(pdfPathWithFileName)
        
        var docController:UIDocumentInteractionController!
        let url = NSURL(fileURLWithPath: pdfPathWithFileName)
        docController = UIDocumentInteractionController(URL: url)
        docController.presentOptionsMenuFromRect(sender.frame, inView:self.view, animated:true)
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        /*
        if (segue.identifier == "SegueResult12"){
            print(caract2.anchoCalle)
            let DestViewController : Result12 = segue.destinationViewController as! Result12
            DestViewController.caract2 =  caract2
        }
        */

    }
    
    
    
    
    override func viewDidLoad() {
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
            print("ResultadosCR Objetos: \(fetchResults.count)")
            newItemB = fetchResults[0]
            
            if (fetchResults[0].anchoCalle == 0){
                
                volumenAplicacion.backgroundColor = UIColor.grayColor();
                velocidadAvance.backgroundColor = UIColor.grayColor();
                anchoTrabajo.backgroundColor = UIColor.grayColor();
                caudalLiqTotal.backgroundColor = UIColor.grayColor();
                numBoquillasTotal.backgroundColor = UIColor.grayColor();
                numBoquillasPorSector.backgroundColor = UIColor.grayColor();
                boquillasCerrarZonaAlta.backgroundColor = UIColor.grayColor();
                boquillasCerrarZonaBaja.backgroundColor = UIColor.grayColor();
                NumBoquillasZonaAlta.backgroundColor = UIColor.grayColor();
                NumBoquillasZonaMedia.backgroundColor = UIColor.grayColor();
                NumBoquillasZonaBaja.backgroundColor = UIColor.grayColor();
                vegetacionZonaAlta.backgroundColor = UIColor.grayColor();
                vegetacionZonaMedia.backgroundColor = UIColor.grayColor();
                vegetacionZonaBaja.backgroundColor = UIColor.grayColor();
                caudalLiquidoSector.backgroundColor = UIColor.grayColor();
                variacionCaudalAdmisible.backgroundColor = UIColor.grayColor();
                caudalLiquidoZonaAlta.backgroundColor = UIColor.grayColor();
                caudalLiquidoZonaMedia.backgroundColor = UIColor.grayColor();
                caudalLiquidoZonaBaja.backgroundColor = UIColor.grayColor();
                
            }
            else{
                let fetchRequest3 = NSFetchRequest(entityName: "B1")
                if let resultados = (try? managedObjectContext!.executeFetchRequest(fetchRequest3)) as? [B1] {
                    

                volumenAplicacion.text = "\(resultados[0].volumenApp) L/ha"
                
                velocidadAvance.text = "\(resultados[0].velocidadAvance) km/h"
                
                anchoTrabajo.text = "\(resultados[0].anchoCalle) m"
                
                caudalLiqTotal.text = "\(resultados[0].caudalLiquidoTotal) L/min"
                
                numBoquillasTotal.text = "\(resultados[0].numeroTotalBoquillas) "
                numBoquillasPorSector.text = "\(resultados[0].numeroBoquillasSector) "
                boquillasCerrarZonaAlta.text = "\(resultados[0].numeroBoquillasCerradasAlta) "
                boquillasCerrarZonaBaja.text = "\(resultados[0].numeroBoquillasCerradasBaja) "
                NumBoquillasZonaAlta.text = "\(resultados[0].numeroBoquillasAbiertasAlta) "
                NumBoquillasZonaMedia.text = "\(resultados[0].numeroBoquillasAbiertasMedia) "
                NumBoquillasZonaBaja.text = "\(resultados[0].numeroBoquillasAbiertasBaja) "
                vegetacionZonaAlta.text = "\(resultados[0].porcentajeVegetacionAlta) %"
                vegetacionZonaMedia.text = "\(resultados[0].porcentajeVegetacionMedia) %"
                vegetacionZonaBaja.text = "\(resultados[0].porcentajeVegetacionBaja) %"
                caudalLiquidoSector.text = "\(resultados[0].caudalLiquidoSector) L/min"
                variacionCaudalAdmisible.text = "\(resultados[0].variacionCaudalAdmisible) %"
                caudalLiquidoZonaAlta.text = "\(resultados[0].intervaloCaudalAdmisible0) - \(resultados[0].intervaloCaudalAdmisible1) L/min"
                caudalLiquidoZonaMedia.text = "\(resultados[0].intervaloCaudalAdmisible2) - \(resultados[0].intervaloCaudalAdmisible3) L/min"
                caudalLiquidoZonaBaja.text = "\(resultados[0].intervaloCaudalAdmisible4) - \(resultados[0].intervaloCaudalAdmisible5) L/min"
                
                }
            }
            
            let fetchRequestZ = NSFetchRequest(entityName: "Z1")
            if let fetchResultsZ = (try? managedObjectContext!.executeFetchRequest(fetchRequestZ)) as? [Z1] {
                
                fechaText = "Fecha: \(fetchResultsZ[0].fecha)"
                idParcelaText = "Identificación de la parcela: \(fetchResultsZ[0].idParcela)"
                idTratamientoText = "Identificación del tratamiento: \(fetchResultsZ[0].idTratamiento)"
                referenciaText = "Referencia: \(fetchResultsZ[0].referencia)"
                
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
    
    
    
    func generatePDFs(filePath: String) {
        UIGraphicsBeginPDFContextToFile(filePath, CGRectZero, nil)
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1200), nil)
        drawBackground()
        //drawText()
        print("PDF creado!")
        UIGraphicsEndPDFContext()
        
        
        
    }
    
    func drawBackground(){
        
        print("back creado!")
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        let rect:CGRect = CGRectMake(0, 0, 850, 1100)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextFillRect(context, rect)
        
        
        
    }
    
    /*
    
    func drawText(){
        
        print("back creado!")
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        var font:UIFont = UIFont (name: "Times New Roman", size: 18)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        var y = 170;
        var textRect:CGRect = CGRectMake(10, 10, 300, 20)
        let baselineAdjust = 1.0
        let attrsDictionary =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        
        print(idTratamientoText)
        for i in 0...3{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = [fechaText, idParcelaText, idTratamientoText, referenciaText, gradoPodaText];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            var auxiliar = PDFarray[i] as! NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = 410;
        
        for i in 0...5{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = ["Densidad foliar del árbol: \(densidadFoliarText)", "Marco de plantación de \(anchoCalleText) x \(distanciaArbolesText)", "Volumen del árbol: \(volumenArbolText)","Forma del árbol: \(formaArbolText)", "Fecha de la última poda: \(fechaUltimaPodaText)", "\(gradoPodaText)"];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            var auxiliar = PDFarray[i] as! NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = 640;
        
        for i in 0...3{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(350), CGFloat(20))
            var PDFarray = ["Productos a aplicar: \(productosAplicarText)", "Forma de actuación: \(formaActuacionText)", "¿Utiliza coadyuvantes? \(mojantesText)", "Zona crítica a tratar: \(zonaCriticaText)", "\(gradoPodaText)"];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            var auxiliar = PDFarray[i] as! NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = 810;
        
        for i in 0...2{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(350), CGFloat(20))
            var PDFarray = ["Temperatura: \(temperaturaTextA)", "Humedad relativa: \(humedadRelativaTextA)", "Velocidad del viento: \(velocidadVientoTextA)", "\(gradoPodaText)"];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            var auxiliar = PDFarray[i] as! NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
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
        let attrsTitulo =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        var tituloArray = "DOSACÍTRIC"
        textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
        tituloArray.drawInRect(textRect, withAttributes: attrsTitulo)
        
        font = UIFont (name: "Times New Roman", size: 40)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsA =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        var AArray = "A. IDENTIFICACIÓN DEL TRATAMIENTO"
        textRect = CGRectMake(CGFloat(40), CGFloat(110), CGFloat(800), CGFloat(90))
        AArray.drawInRect(textRect, withAttributes: attrsA)
        
        font = UIFont (name: "Times New Roman", size: 40)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        var BArray = "B. VOLUMEN DE APLICACIÓN"
        textRect = CGRectMake(CGFloat(40), CGFloat(320), CGFloat(800), CGFloat(90))
        BArray.drawInRect(textRect, withAttributes: attrsB)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB1 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        var B1Array = "B.1. Características del cultivo"
        textRect = CGRectMake(CGFloat(80), CGFloat(370), CGFloat(800), CGFloat(90))
        B1Array.drawInRect(textRect, withAttributes: attrsB1)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB2 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        var B2Array = "B.2. Tipo de tratamiento"
        textRect = CGRectMake(CGFloat(80), CGFloat(600), CGFloat(800), CGFloat(90))
        B2Array.drawInRect(textRect, withAttributes: attrsB2)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB3 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        var B3Array = "B.3. Condiciones meteorológicas"
        textRect = CGRectMake(CGFloat(80), CGFloat(770), CGFloat(800), CGFloat(90))
        B3Array.drawInRect(textRect, withAttributes: attrsB3)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB4 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        var B4Array = "B.4. Equipo empleado"
        textRect = CGRectMake(CGFloat(80), CGFloat(910), CGFloat(800), CGFloat(90))
        B4Array.drawInRect(textRect, withAttributes: attrsB4)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB5 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        var B5Array = "B.5. Volumen de aplicación"
        textRect = CGRectMake(CGFloat(80), CGFloat(1000), CGFloat(800), CGFloat(90))
        B5Array.drawInRect(textRect, withAttributes: attrsB5)
    }
    */
    
    
    
}