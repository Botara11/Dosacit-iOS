//
//  ID.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 8/11/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class ID: ResponsiveTextFieldViewController, UITextFieldDelegate {
    
    
    @IBOutlet var fechaText: UITextField!
    @IBOutlet var idParcelaText: UITextField!
    @IBOutlet var idTratamientoText: UITextField!
    @IBOutlet var referenciaText: UITextField!
    
    /*
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    if textField == fechaText{
    idParcelaText.becomeFirstResponder()
    }else{
    idParcelaText.resignFirstResponder()
    }
    return true;
    }*/
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        if (textField.tag == 0){
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= 22 // Bool
        } else if (textField.tag == 1){
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 17 // Bool
        } else if (textField.tag == 2){
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 17 // Bool
        } else {
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 20 // Bool
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag: NSInteger = textField.tag + 1;
        // Try to find next responder
        if let nextResponder: UIResponder! = textField.superview!.viewWithTag(nextTag){
            nextResponder.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        return false // We do not want UITextField to insert line-breaks.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "IDCultivo1"){
            
            
            if fechaText.text == ""  {
                alert("ERROR",mensaje: "El campo de 'fecha' no puede estar vacio")
            }
        }
        let fetchRequest = NSFetchRequest(entityName: "Z1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Z1] {
            print(fetchResults.count)
            
            fetchResults[0].fecha = fechaText.text! as String
            fetchResults[0].idParcela = idParcelaText.text! as String
            fetchResults[0].idTratamiento = idTratamientoText.text! as String
            fetchResults[0].referencia = referenciaText.text! as String
            print(idTratamientoText.text)
            do {
                try managedObjectContext!.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
    }
    
    func alert(title :String,mensaje: String){
        let alertController = UIAlertController(title: title, message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        
        
        fechaText.tag = 0
        idParcelaText.tag = 1
        idTratamientoText.tag = 2
        referenciaText.tag = 3
        
        let fetchRequest = NSFetchRequest(entityName: "Z1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Z1] {
            print("Numero de resultados: \(fetchResults.count)")
            
            if (fetchResults.count != 0 && fetchResults[0].fecha != "Sin fecha" ){
                fechaText.text = "\(fetchResults[0].fecha)"
            }else{
                fechaText.text = ""
            }
            
            if (fetchResults.count != 0 && fetchResults[0].idParcela != "Sin identificar"){
                idParcelaText.text = "\(fetchResults[0].idParcela)"
            }else{
                fechaText.text = ""
            }
            
            if ( fetchResults.count != 0 && fetchResults[0].idTratamiento != "Sin identificar"){
                idTratamientoText.text = "\(fetchResults[0].idTratamiento)"
            }else{
                fechaText.text = ""
            }
            
            if ( fetchResults.count != 0 && fetchResults[0].referencia != "Sin referencia"){
                referenciaText.text = "\(fetchResults[0].referencia)"
            }else{
                fechaText.text = ""
            }
        }
        
        
        //newItemZ.fecha = " Sin fecha"
        //newItemZ.idParcela = "Sin identificar"
        //newItemZ.idTratamiento = "Sin identificar"
        //newItemZ.referencia = "Sin referencia"
        
    }
    
    
    
    //Todo a continuacion es para el test del pdf en el iphone 4S
    var docController:UIDocumentInteractionController!
    
    @IBAction func pdf_iphone4(sender: AnyObject) {
        //let pageSize:CGSize = CGSizeMake (850, 1100)
        let fileName: NSString = "DosacítricD.pdf"
        let path:NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory: AnyObject = path.objectAtIndex(0)
        let pdfPathWithFileName = documentDirectory.stringByAppendingPathComponent(fileName as String)
        print(pdfPathWithFileName)
        
        generatePDFs(pdfPathWithFileName)
        
        let url = NSURL(fileURLWithPath: pdfPathWithFileName)
        docController = UIDocumentInteractionController(URL: url)
        docController.presentOptionsMenuFromRect(sender.frame, inView:self.view, animated:true)
    }
    
    func generatePDFs(filePath: String) {
        UIGraphicsBeginPDFContextToFile(filePath, CGRectZero, nil)
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 850, 1200), nil)
        drawBackground()
        drawText()
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
    
    
    func drawText(){
        
        print("back creado!")
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        var font:UIFont = UIFont (name: "Times New Roman", size: 21)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        var y = 180;
        var textRect:CGRect = CGRectMake(10, 10, 300, 20)
        let baselineAdjust = 1.0
        let attrsDictionary =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        
        
        for i in 0...3{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = [fechaText.text, idParcelaText.text, idTratamientoText.text, referenciaText.text];
           
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i]! as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = 420;
        
        for i in 0...1{
            textRect = CGRectMake(CGFloat(100), CGFloat(y), CGFloat(700), CGFloat(20))
            var PDFarray = ["Ancho de trabajoico del equipo","NO"];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = 510;
        font = UIFont (name: "Times New Roman", size: 18)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        let baselineAdju = 1.0
        let attrsDictiona =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdju]
        
        
        for i in 0...1{
            textRect = CGRectMake(CGFloat(150), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = ["Num. de boquillas por zona:Volumen"," de caldo aplicado: L/ha"];
            // var PDFarray = [densidadFoliarText, anchoCalleText, volumenArbolText, formaArbolText, fechaUltimaPodaText, gradoPodaText, productosAplicarText, formaActuacionText, mojantesText, zonaCriticaText, temperaturaText.text, humedadRelativaText.text, velocidadVientoText.text, tipoPulverizadorText.text, volumenAplicacionHAText.text];
            y=y+30;
            // let myString:NSString = "Azúcar Álvaro"
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictiona)
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
        CGContextSetFillColorWithColor(context, UIColor.orangeColor().CGColor)
        let attrsTitulo =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let tituloArray = "DOSACÍTRIC"
        textRect = CGRectMake(CGFloat(40), CGFloat(25), CGFloat(800), CGFloat(60))
        tituloArray.drawInRect(textRect, withAttributes: attrsTitulo)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsA =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let AArray = "A. IDENTIFICACIÓN DEL TRATAMIENTO"
        textRect = CGRectMake(CGFloat(40), CGFloat(125), CGFloat(800), CGFloat(90))
        AArray.drawInRect(textRect, withAttributes: attrsA)
        
        font = UIFont (name: "Times New Roman", size: 30)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let BArray = "D. DETERMINACIÓN DEL VOLUMEN DE CALDO APLICADO"
        textRect = CGRectMake(CGFloat(40), CGFloat(330), CGFloat(800), CGFloat(90))
        BArray.drawInRect(textRect, withAttributes: attrsB)
        
        
        
        
    }

    
    
    
}