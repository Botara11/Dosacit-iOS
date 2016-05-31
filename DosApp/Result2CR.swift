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
    
    //var size:Int = 0;
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
    
    var marca1: String!
    var marca2: String!
    var marca3: String!
    var marca4: String!
    
    var varaux:Int=0;
    
    
    var cadena = [String]()
    
    func estaEnCadena(item:String)->Bool{
        for aux in cadena{
            if aux==item{
                return true
            }
        }
        return false
    }
    
    var presiones = [String]()
    
    func estaEnCadenaPres(item:String)->Bool{
        for aux in presiones{
            if aux==item{
                return true
            }
        }
        return false
    }
    
    var presOrden = [Int]()
    
    var zona = [String]()
    var sections = [Section]()
    
    func estaEnCadenaBoq(item:String)->Bool{
        for aux in zona{
            if aux==item{
                return true
            }
        }
        return false
    }
    
    class Section {
        var boquis: [String] = []
        
        func addBoq(boq: String) {
            self.boquis.append(boq)
        }
    }
    
    var zonaA = [String]()
    var zonaM = [String]()
    var zonaB = [String]()
    
    
    
    var docController:UIDocumentInteractionController!
    
    @IBAction func PDFgeneratoraction(sender: AnyObject) {
        //let pageSize:CGSize = CGSizeMake (850, 1100)
        let fileName: NSString = "DosacítricC.pdf"
        let path:NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory: AnyObject = path.objectAtIndex(0)
        let pdfPathWithFileName = documentDirectory.stringByAppendingPathComponent(fileName as String)
        print(pdfPathWithFileName)
        
        generatePDFs(pdfPathWithFileName)
        
        let url = NSURL(fileURLWithPath: pdfPathWithFileName)
        docController = UIDocumentInteractionController(URL: url)
        docController.presentOptionsMenuFromRect(sender.frame, inView:self.view, animated:true)
        
    }
    
    @IBAction func siguiente(){
        
        let fetchRequest2 = NSFetchRequest(entityName: "FiltroBoquillas")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest2)) as? [FiltroBoquillas]{
            if (fetchResults.count != 0){
                let vc = self.storyboard?.instantiateViewControllerWithIdentifier("Result21") as! Result21
                self.presentViewController(vc, animated: true, completion: nil)
            }
            else{
                let vc = self.storyboard?.instantiateViewControllerWithIdentifier("sinboquillas")
                self.presentViewController(vc!, animated: true, completion: nil)
            }
        }
        
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
                    
                    let volapp:String = String(format:"%.0f", resultados[0].volumenApp)
                    volumenAplicacion.text = "\(volapp) L/ha"
                    
                    velocidadAvance.text = "\(resultados[0].velocidadAvance) km/h"
                    
                    let b:String = String(format:"%.0f", resultados[0].anchoCalle)
                    anchoTrabajo.text = "\(b) m"
                    
                    let caudalLiq:String = String(format:"%.01f", resultados[0].caudalLiquidoTotal)
                    caudalLiqTotal.text = "\(caudalLiq) L/min"
                    
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
                    let caudalLiqSector:String = String(format:"%.02f", resultados[0].caudalLiquidoSector)
                    caudalLiquidoSector.text = "\(caudalLiqSector) L/min"
                    let variacionCaudal:String = String(format:"%.0f", resultados[0].variacionCaudalAdmisible)
                    variacionCaudalAdmisible.text = "\(variacionCaudal) %"
                    let intervalo0:String = String(format:"%.02f", resultados[0].intervaloCaudalAdmisible0)
                    let intervalo1:String = String(format:"%.02f", resultados[0].intervaloCaudalAdmisible1)
                    let intervalo2:String = String(format:"%.02f", resultados[0].intervaloCaudalAdmisible2)
                    let intervalo3:String = String(format:"%.02f", resultados[0].intervaloCaudalAdmisible3)
                    let intervalo4:String = String(format:"%.02f", resultados[0].intervaloCaudalAdmisible4)
                    let intervalo5:String = String(format:"%.02f", resultados[0].intervaloCaudalAdmisible5)
                    caudalLiquidoZonaAlta.text = "\(intervalo0) - \(intervalo1) L/min"
                    caudalLiquidoZonaMedia.text = "\(intervalo2) - \(intervalo3) L/min"
                    caudalLiquidoZonaBaja.text = "\(intervalo4) - \(intervalo5) L/min"
                    
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
            
            
            
            let fetchRequest2 = NSFetchRequest(entityName: "FiltroBoquillas")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest2)) as? [FiltroBoquillas]{
                if (fetchResults.count != 0){
                    for fe in fetchResults{
                        if !estaEnCadena(fe.marca) {
                            cadena.append(fe.marca)
                            
                        }
                    }
                }
            }
            
            
            
            
            
        }
        
    }
    
    
    
    func generatePDFs(filePath: String) {
        UIGraphicsBeginPDFContextToFile(filePath, CGRectZero, nil)
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1250), nil)
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
        drawText()
        
        
    }
    
    
    
    func drawText(){
        
        print("back creado!")
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        var font:UIFont = UIFont (name: "Times New Roman", size: 21)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        var y = 170;
        var textRect:CGRect = CGRectMake(10, 10, 300, 20)
        let baselineAdjust = 1.0
        let attrsDictionary =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        
        print(idTratamientoText)
        for i in 0...3{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = [fechaText, idParcelaText, idTratamientoText, referenciaText];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = 410;
        
        for i in 0...7{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(600), CGFloat(30))
            var PDFarray = ["Volumen de aplicación (V): "+volumenAplicacion.text!, "Velocidad de avance deseada (v): "+velocidadAvance.text!, "Ancho de trabajo (a): "+anchoTrabajo.text!,"Caudal líquido total: "+caudalLiqTotal.text!, "Características del sistema hidráulico del equipo:", "- Nº total boquillas: "+numBoquillasTotal.text!, "- Nº boquillas disponibles/sector: "+numBoquillasPorSector.text!, "Boquillas a cerrar por zona"];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+35;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        font = UIFont (name: "Times New Roman", size: 18)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        textRect = CGRectMake(10, 10, 300, 20)
        let baselineAdjus = 1.0
        let attrsDictionar =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjus]
        
        
        for i in 0...1{
            textRect = CGRectMake(CGFloat(120), CGFloat(y), CGFloat(350), CGFloat(20))
            var PDFarray = ["    Zona Alta: "+boquillasCerrarZonaAlta.text!, "    Zona Baja: "+boquillasCerrarZonaBaja.text!];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionar)
        }
        
        
        font = UIFont (name: "Times New Roman", size: 21)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo1 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let tituloArray1 = "Número boquillas abiertas por zona"
        textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(800), CGFloat(60))
        tituloArray1.drawInRect(textRect, withAttributes: attrsTitulo1)
        
        
        y = y + 30;
        
        font = UIFont (name: "Times New Roman", size: 18)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo2 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        
        
        for i in 0...2{
            textRect = CGRectMake(CGFloat(120), CGFloat(y), CGFloat(350), CGFloat(20))
            var PDFarray = ["    Zona Alta (nA): "+NumBoquillasZonaAlta.text!, "    Zona Media (nM): "+NumBoquillasZonaMedia.text!, "    Zona Baja (nB): "+NumBoquillasZonaBaja.text!];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsTitulo2)
        }
        
        font = UIFont (name: "Times New Roman", size: 21)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo3 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let tituloArray3 = "Porcentaje de vegetación a pulverizar por zona"
        textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(800), CGFloat(60))
        tituloArray3.drawInRect(textRect, withAttributes: attrsTitulo3)
        
        y = y + 30;
        
        font = UIFont (name: "Times New Roman", size: 18)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo4 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        
        
        for i in 0...2{
            textRect = CGRectMake(CGFloat(120), CGFloat(y), CGFloat(350), CGFloat(20))
            var PDFarray = ["    Zona Alta (A%): "+vegetacionZonaAlta.text!, "    Zona Media (M%): "+vegetacionZonaMedia.text!, "    Zona Baja (B%): "+vegetacionZonaBaja.text!];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsTitulo4)
        }
        
        font = UIFont (name: "Times New Roman", size: 21)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo5 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let tituloArray5 = "Características del caudal"
        textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(800), CGFloat(60))
        tituloArray5.drawInRect(textRect, withAttributes: attrsTitulo5)
        
        y = y + 30;
        
        font = UIFont (name: "Times New Roman", size: 18)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo6 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        
        
        for i in 0...1{
            textRect = CGRectMake(CGFloat(120), CGFloat(y), CGFloat(350), CGFloat(20))
            var PDFarray = ["    Caudal líquido por sector: "+caudalLiquidoSector.text!, "    Variación de caudal admisible: "+variacionCaudalAdmisible.text!];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsTitulo6)
        }
        
        font = UIFont (name: "Times New Roman", size: 21)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo7 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let tituloArray7 = "Caudal líquido por boquilla"
        textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(800), CGFloat(60))
        tituloArray7.drawInRect(textRect, withAttributes: attrsTitulo7)
        
        y = y + 30;
        
        font = UIFont (name: "Times New Roman", size: 18)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo8 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        
        
        for i in 0...2{
            textRect = CGRectMake(CGFloat(120), CGFloat(y), CGFloat(450), CGFloat(20))
            var PDFarray = ["    Zona Alta (nA): "+caudalLiquidoZonaAlta.text!, "    Zona Media (nM): "+caudalLiquidoZonaMedia.text!, "    Zona Baja (nB): "+caudalLiquidoZonaBaja.text!];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsTitulo8)
        }
        
        
        y = 25;
        font = UIFont (name: "Times New Roman", size: 15)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        let baselineAdj = 1.0
        let attrsDiction =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdj]
        
        for i in 0...2{
            textRect = CGRectMake(CGFloat(450), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = ["dosacitric@upv.es", "Unidad de Mecanización y Tecnología Agraria", "UNIVERSIDAD POLITÉCNICA DE VALENCIA"];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+25;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDiction)
        }
        
        
        
        
        
        
        font = UIFont (name: "Times New Roman", size: 60)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitulo =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let tituloArray = "DOSACÍTRIC"
        textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
        tituloArray.drawInRect(textRect, withAttributes: attrsTitulo)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsA =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let AArray = "A. IDENTIFICACIÓN DEL TRATAMIENTO"
        textRect = CGRectMake(CGFloat(40), CGFloat(120), CGFloat(800), CGFloat(90))
        AArray.drawInRect(textRect, withAttributes: attrsA)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let BArray = "C. REGULACIÓN DEL PULVERIZADOR HIDRONEUMÁTICO (TURBO)"
        textRect = CGRectMake(CGFloat(40), CGFloat(320), CGFloat(800), CGFloat(90))
        BArray.drawInRect(textRect, withAttributes: attrsB)
        
        
        
        
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1200), nil)
        font = UIFont (name: "Times New Roman", size: 60)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsTitul =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let tituloArra = "DOSACÍTRIC"
        textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
        tituloArra.drawInRect(textRect, withAttributes: attrsTitul)
        
        y = 25;
        font = UIFont (name: "Times New Roman", size: 15)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        let baselineAd = 1.0
        let attrsDictio =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAd]
        
        for i in 0...2{
            textRect = CGRectMake(CGFloat(450), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = ["dosacitric@upv.es", "Unidad de Mecanización y Tecnología Agraria", "UNIVERSIDAD POLITÉCNICA DE VALENCIA"];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+25;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictio)
        }
        
        
        
        
        
        
        
        
        
        
        y=120;
        
        
        for i in 0...cadena.count-1{
            
            CGContextSetLineWidth(context, 1.0);
            
            CGContextMoveToPoint(context, 40, CGFloat(y));
            CGContextAddLineToPoint(context, 600, CGFloat(y));
            
            CGContextMoveToPoint(context, 40, CGFloat(y));
            CGContextAddLineToPoint(context, 40, CGFloat(y+41));
            
            CGContextMoveToPoint(context, 40, CGFloat(y+41));
            CGContextAddLineToPoint(context, 600, CGFloat(y+41));
            
            CGContextMoveToPoint(context, 600, CGFloat(y));
            CGContextAddLineToPoint(context, 600, CGFloat(y+41));
            
            CGContextStrokePath(context);
            
            font = UIFont (name: "Times New Roman", size: 21)!
            CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
            let attrsTitulo9 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
            textRect = CGRectMake(CGFloat(50), CGFloat(y+10), CGFloat(400), CGFloat(25))
            let PDFarray = cadena[i];
            PDFarray.drawInRect(textRect, withAttributes: attrsTitulo9)
            if(y>=1150){
                UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1200), nil)
                font = UIFont (name: "Times New Roman", size: 60)!
                CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                let attrsTitul =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                let tituloArra = "DOSACÍTRIC"
                textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
                tituloArra.drawInRect(textRect, withAttributes: attrsTitul)
                
                y = 25;
                font = UIFont (name: "Times New Roman", size: 15)!
                CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
                let baselineAd = 1.0
                let attrsDictio =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAd]
                
                for i in 0...2{
                    textRect = CGRectMake(CGFloat(450), CGFloat(y), CGFloat(400), CGFloat(20))
                    var PDFarray = ["dosacitric@upv.es", "Unidad de Mecanización y Tecnología Agraria", "UNIVERSIDAD POLITÉCNICA DE VALENCIA"];
                    // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
                    y=y+25;
                    // let myString:NSString = "Azúcar Álvaro"
                    let auxiliar = PDFarray[i] as NSString
                    auxiliar.drawInRect(textRect, withAttributes: attrsDictio)
                }
                
                y=100;
                
            }
            y=y+60;
            
            presiones.removeAll()
            
            let str = ("marca == %@") as String
            let predicate1 = NSPredicate(format: str , cadena[i])
            let fetchRequest = NSFetchRequest(entityName: "FiltroBoquillas")
            fetchRequest.predicate = predicate1
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [FiltroBoquillas]{
                for fe in fetchResults{
                    if !estaEnCadenaPres(fe.presion) {
                        presiones.append(fe.presion)
                    }
                }
            }
            /*
            for x in 0...100{
                presOrden.append(0);
            }
            */
            
            for u in 0...presiones.count-1{
                if(presiones[u]=="p6"){
                    presOrden.append(6);
                }else if(presiones[u]=="p7"){
                    presOrden.append(7);
                }else if(presiones[u]=="p8"){
                    presOrden.append(8);
                }else if(presiones[u]=="p9"){
                    presOrden.append(9);
                }else if(presiones[u]=="p10"){
                    presOrden.append(10);
                }else if(presiones[u]=="p11"){
                    presOrden.append(11);
                }else if(presiones[u]=="p12"){
                    presOrden.append(12);
                }else if(presiones[u]=="p13"){
                    presOrden.append(13);
                }else if(presiones[u]=="p14"){
                    presOrden.append(14);
                }else if(presiones[u]=="p15"){
                    presOrden.append(15);
                }else if(presiones[u]=="p16"){
                    presOrden.append(16);
                }
                
                
            }
            
            print("Marca: \(cadena[i])")
            
            if (presOrden.count > 1){
                for a in 0...presOrden.count-2{
                    for b in a+1...presOrden.count-1{
                        if(presOrden[a]>presOrden[b]){
                            varaux=presOrden[a];
                            presOrden[a]=presOrden[b];
                            presOrden[b]=varaux;
                        }
                    }
                }
            }
            
            
            print("Presiones rellenas")
            for tup in presOrden{
                print(tup, terminator: "")
            }
            
            for o in 0...presOrden.count-1{
                print("---Presion: \(presOrden[o])")
                
                //print(cadena[i], presOrden[o])
                font = UIFont (name: "Times New Roman", size: 21)!
                CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                let attrsTitulopresiones =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                textRect = CGRectMake(CGFloat(50), CGFloat(y), CGFloat(400), CGFloat(25))
                let PDFarray = "Presión: \(presOrden[o]) bar";
                PDFarray.drawInRect(textRect, withAttributes: attrsTitulopresiones)
                y=y+25;
                
                CGContextSetLineWidth(context, 1.0);
                
                CGContextMoveToPoint(context, 40, CGFloat(y));
                CGContextAddLineToPoint(context, 810, CGFloat(y));
                CGContextStrokePath(context);
                if(y>=1150){
                    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1200), nil)
                    font = UIFont (name: "Times New Roman", size: 60)!
                    CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                    let attrsTitul =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                    let tituloArra = "DOSACÍTRIC"
                    textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
                    tituloArra.drawInRect(textRect, withAttributes: attrsTitul)
                    
                    y = 25;
                    font = UIFont (name: "Times New Roman", size: 15)!
                    CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
                    let baselineAd = 1.0
                    let attrsDictio =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAd]
                    
                    for i in 0...2{
                        textRect = CGRectMake(CGFloat(450), CGFloat(y), CGFloat(400), CGFloat(20))
                        var PDFarray = ["dosacitric@upv.es", "Unidad de Mecanización y Tecnología Agraria", "UNIVERSIDAD POLITÉCNICA DE VALENCIA"];
                        // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
                        y=y+25;
                        // let myString:NSString = "Azúcar Álvaro"
                        let auxiliar = PDFarray[i] as NSString
                        auxiliar.drawInRect(textRect, withAttributes: attrsDictio)
                    }
                    
                    y=100;
                    
                }
                y=y+10;
                /*
                for x in 0...100{
                    zonaA.append("");
                    zonaM.append("");
                    zonaB.append("");
                }
                */
                
                let str = ("marca == %@ AND presion == %@") as String
                let predicate1 = NSPredicate(format: str , cadena[i], "p\(presOrden[o])")
                let fetchRequest = NSFetchRequest(entityName: "FiltroBoquillas")
                fetchRequest.predicate = predicate1
                if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [FiltroBoquillas]{
                    for fe in fetchResults{
                        //Aqui habria que diferenciar entre zona1 zona2 y zona3
                        //cadena.append(fe.modelo)
                        //self.tableData.append(fe.modelo)
                        
                        if fe.zona == "alta" {
                            //print("alta \(fe.modelo)")
                            zonaA.append(fe.modelo);
                        }
                        if fe.zona == "media" {
                            //print("media \(fe.modelo)")
                            zonaM.append(fe.modelo);
                        }
                        if fe.zona == "baja" {
                            //print("baja \(fe.modelo)")
                            zonaB.append(fe.modelo);
                        }
                    }
                }
                
                
                font = UIFont (name: "Times New Roman", size: 18)!
                CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                let attrsTitulopresiones2 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                textRect = CGRectMake(CGFloat(50), CGFloat(y), CGFloat(400), CGFloat(25))
                let PDFarray2 = "Zona Alta: ";
                PDFarray2.drawInRect(textRect, withAttributes: attrsTitulopresiones2)
                var x=160;

                for ab in 0...zonaA.count-1{
                    if(ab != 0 && ab%3 == 0){
                        x=160;
                        y=y+20
                    }
                    
                    font = UIFont (name: "Times New Roman", size: 18)!
                    CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                    let attrsTitulopresiones1 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                    textRect = CGRectMake(CGFloat(x), CGFloat(y), CGFloat(400), CGFloat(25))
                    let PDFarray1 = "\(zonaA[ab])";
                    PDFarray1.drawInRect(textRect, withAttributes: attrsTitulopresiones1)
                    //print(zonaA[ab])
                    x=x+200;
                    
                    
                }
                //zonaA.removeAll()
                
                if(y>=1150){
                    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1200), nil)
                    font = UIFont (name: "Times New Roman", size: 60)!
                    CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                    let attrsTitul =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                    let tituloArra = "DOSACÍTRIC"
                    textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
                    tituloArra.drawInRect(textRect, withAttributes: attrsTitul)
                    
                    y = 25;
                    font = UIFont (name: "Times New Roman", size: 15)!
                    CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
                    let baselineAd = 1.0
                    let attrsDictio =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAd]
                    
                    for i in 0...2{
                        textRect = CGRectMake(CGFloat(450), CGFloat(y), CGFloat(400), CGFloat(20))
                        var PDFarray = ["dosacitric@upv.es", "Unidad de Mecanización y Tecnología Agraria", "UNIVERSIDAD POLITÉCNICA DE VALENCIA"];
                        // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
                        y=y+25;
                        // let myString:NSString = "Azúcar Álvaro"
                        let auxiliar = PDFarray[i] as NSString
                        auxiliar.drawInRect(textRect, withAttributes: attrsDictio)
                    }
                    
                    y=100;
                    
                }
                y=y+25;
                x=160;
                
                font = UIFont (name: "Times New Roman", size: 18)!
                CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                let attrsTitulopresiones3 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                textRect = CGRectMake(CGFloat(50), CGFloat(y), CGFloat(400), CGFloat(25))
                let PDFarray3 = "Zona Media: ";
                PDFarray3.drawInRect(textRect, withAttributes: attrsTitulopresiones3)
                
                
                for ab in 0...zonaM.count-1{
                    if(ab != 0 && ab%3 == 0){
                        x=160;
                        y=y+20
                    }
                    
                    font = UIFont (name: "Times New Roman", size: 18)!
                    CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                    let attrsTitulopresiones1 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                    textRect = CGRectMake(CGFloat(x), CGFloat(y), CGFloat(400), CGFloat(25))
                    let PDFarray1 = "\(zonaM[ab])";
                    PDFarray1.drawInRect(textRect, withAttributes: attrsTitulopresiones1)
                    
                    x=x+200;
                    
                    
                    
                }
                
                //zonaM.removeAll()
                if(y>=1150){
                    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1200), nil)
                    font = UIFont (name: "Times New Roman", size: 60)!
                    CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                    let attrsTitul =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                    let tituloArra = "DOSACÍTRIC"
                    textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
                    tituloArra.drawInRect(textRect, withAttributes: attrsTitul)
                    
                    y = 25;
                    font = UIFont (name: "Times New Roman", size: 15)!
                    CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
                    let baselineAd = 1.0
                    let attrsDictio =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAd]
                    
                    for i in 0...2{
                        textRect = CGRectMake(CGFloat(450), CGFloat(y), CGFloat(400), CGFloat(20))
                        var PDFarray = ["dosacitric@upv.es", "Unidad de Mecanización y Tecnología Agraria", "UNIVERSIDAD POLITÉCNICA DE VALENCIA"];
                        // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
                        y=y+25;
                        // let myString:NSString = "Azúcar Álvaro"
                        let auxiliar = PDFarray[i] as NSString
                        auxiliar.drawInRect(textRect, withAttributes: attrsDictio)
                    }
                    
                    y=100;
                    
                }
                y=y+25;
                x=160;
                
                font = UIFont (name: "Times New Roman", size: 18)!
                CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                let attrsTitulopresiones4 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                textRect = CGRectMake(CGFloat(50), CGFloat(y), CGFloat(400), CGFloat(25))
                let PDFarray4 = "Zona Baja: ";
                PDFarray4.drawInRect(textRect, withAttributes: attrsTitulopresiones4)
                
                
                for ab in 0...zonaB.count-1{
                    if(ab != 0 && ab%3 == 0){
                        x=160;
                        y=y+20
                    }
                    
                    font = UIFont (name: "Times New Roman", size: 18)!
                    CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                    let attrsTitulopresiones1 =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                    textRect = CGRectMake(CGFloat(x), CGFloat(y), CGFloat(400), CGFloat(25))
                    let PDFarray1 = "\(zonaB[ab])";
                    PDFarray1.drawInRect(textRect, withAttributes: attrsTitulopresiones1)
                    
                    x=x+200;
                    
                    
                    
                }
                
                
                //zonaB.removeAll()
                
                
                
                if(y>=1150){
                    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1200), nil)
                    font = UIFont (name: "Times New Roman", size: 60)!
                    CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
                    let attrsTitul =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
                    let tituloArra = "DOSACÍTRIC"
                    textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
                    tituloArra.drawInRect(textRect, withAttributes: attrsTitul)
                    
                    y = 25;
                    font = UIFont (name: "Times New Roman", size: 15)!
                    CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
                    let baselineAd = 1.0
                    let attrsDictio =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAd]
                    
                    for i in 0...2{
                        textRect = CGRectMake(CGFloat(450), CGFloat(y), CGFloat(400), CGFloat(20))
                        var PDFarray = ["dosacitric@upv.es", "Unidad de Mecanización y Tecnología Agraria", "UNIVERSIDAD POLITÉCNICA DE VALENCIA"];
                        // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
                        y=y+25;
                        // let myString:NSString = "Azúcar Álvaro"
                        let auxiliar = PDFarray[i] as NSString
                        auxiliar.drawInRect(textRect, withAttributes: attrsDictio)
                    }
                    
                    
                    y=100;
                    
                }
                y=y+50;
                zonaA.removeAll()
                zonaB.removeAll()
                zonaM.removeAll()
            }
            
            presOrden.removeAll()
            print("Presiones vacias")
            for tup in presOrden{
                print(tup)
            }
        }
        
        
        
        
        
    }
    
    
    
    
}