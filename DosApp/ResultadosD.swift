//
//  ResultadosD.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 25/5/16.
//  Copyright © 2016 UPV. All rights reserved.
//

import UIKit
import CoreData

class ResultadosD: UIViewController{
    
    var fechaText: String!
    var idParcelaText: String!
    var idTratamientoText: String!
    var referenciaText: String!
    @IBOutlet weak var anchoTextfield: UITextView!
    @IBOutlet weak var velocidadTextField: UITextView!
    @IBOutlet weak var nATextfield: UITextView!
    @IBOutlet weak var nMTextfield: UITextView!
    @IBOutlet weak var nBTextfield: UITextView!
    @IBOutlet weak var altaTextfield: UITextView!
    @IBOutlet weak var mediaTextfield: UITextView!
    @IBOutlet weak var bajaTextfield: UITextView!
    @IBOutlet weak var caudalTextfield: UITextView!
    @IBOutlet weak var volumenTextfield: UITextView!
    @IBOutlet weak var presionTextfield: UITextView!
    @IBOutlet weak var PDFGenerar: UIButton!
    
    var docController:UIDocumentInteractionController!
    
    @IBAction func PDGgeneratoraction(sender: AnyObject) {
        //let pageSize:CGSize = CGSizeMake (850, 1100)
        let fileName: NSString = "DosacitricD.pdf"
        let path:NSArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory: AnyObject = path.objectAtIndex(0)
        let pdfPathWithFileName = documentDirectory.stringByAppendingPathComponent(fileName as String)
        print(pdfPathWithFileName)
        
        generatePDFs(pdfPathWithFileName)
        
        let url = NSURL(fileURLWithPath: pdfPathWithFileName)
        docController = UIDocumentInteractionController(URL: url)
        docController.presentOptionsMenuFromRect(sender.frame, inView:self.view, animated:true)
    }


    var caract2 = ParteC()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        caract2.calcularParteC()
        
        
        
        let fetchRequest = NSFetchRequest(entityName: "C1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [C1]{
            
            print("Caudal Zona Alta: \(fetchResults[0].caudalZonaAlta)")
            
            let b:String = String(format:"%.01f",fetchResults[0].anchoCalle)
            
            anchoTextfield.text = ("\(b)")
            
            let a:String = String(format:"%.01f",fetchResults[0].velocidadAvance)
            
            velocidadTextField.text = ("\(a)")
            
            let c:String = String(fetchResults[0].numBoqAbiertasAltaHidraulica)
            
            nATextfield.text = ("\(c)")
            
            let d:String = String(fetchResults[0].numBoqAbiertasMediaHidraulica)
            
            nMTextfield.text = ("\(d)")
            
            let e:String = String(fetchResults[0].numBoqAbiertasBajaHidraulica)
            
            nBTextfield.text = ("\(e)")
            
            let f:String = String(format:"%.00f", fetchResults[0].caudalTotal)
            
            caudalTextfield.text = ("\(f)")
            
            let g:String = String(format:"%.00f", fetchResults[0].volumenCaldoAplicado)
            
            volumenTextfield.text = ("\(g)")
            
            let h:String = String(fetchResults[0].marca)+"."+String(fetchResults[0].nombreZonaAlta)
            
            altaTextfield.text = ("\(h)")
            
            let i:String = String(fetchResults[0].marca)+"."+String(fetchResults[0].nombreZonaMedia)
            
            mediaTextfield.text = ("\(i)")
            
            let j:String = String(fetchResults[0].marca)+"."+String(fetchResults[0].nombreZonaBaja)
            
            bajaTextfield.text = ("\(j)")
            
            if(fetchResults[0].presion=="p6"){
                
                presionTextfield.text = ("6 bar")
                
            }else if(fetchResults[0].presion=="p7"){
                
                presionTextfield.text = ("7 bar")
                
            }else if(fetchResults[0].presion=="p8"){
                
                presionTextfield.text = ("8 bar")
                
            }else if(fetchResults[0].presion=="p9"){
                
                presionTextfield.text = ("9 bar")
                
            }else if(fetchResults[0].presion=="p10"){
                
                presionTextfield.text = ("10 bar")
                
            }else if(fetchResults[0].presion=="p11"){
                
                presionTextfield.text = ("11 bar")
                
            }else if(fetchResults[0].presion=="p12"){
                
                presionTextfield.text = ("12 bar")
                
            }else if(fetchResults[0].presion=="p13"){
                
                presionTextfield.text = ("13 bar")
                
            }else if(fetchResults[0].presion=="p14"){
                
                presionTextfield.text = ("14 bar")
                
            }else if(fetchResults[0].presion=="p15"){
                
                presionTextfield.text = ("15 bar")
                
            }else if(fetchResults[0].presion=="p16"){
                
                presionTextfield.text = ("16 bar")
                
            }
            
            let fetchRequestZ = NSFetchRequest(entityName: "Z1")
            if let fetchResultsZ = (try? managedObjectContext!.executeFetchRequest(fetchRequestZ)) as? [Z1] {
                
                fechaText = "Fecha: \(fetchResultsZ[0].fecha)"
                idParcelaText = "Identificación de la parcela: \(fetchResultsZ[0].idParcela)"
                idTratamientoText = "Identificación del tratamiento: \(fetchResultsZ[0].idTratamiento)"
                referenciaText = "Referencia: \(fetchResultsZ[0].referencia)"
                
            }
            
        }
        
    }
    
    
    
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if (identifier != nil && identifier == "nuevoTratamiento"){
            let alertController = UIAlertController(title: "Nuevo tratamiento", message: "¿Realmente quiere borrar todos los datos introducidos en DOSACITRIC?", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "No", style: .Cancel) { (action) in
                print("Cancel")
            }
            let OKAction = UIAlertAction(title: "Si", style: .Default) { (action) in
                print("ok")
                var error : NSError?
                self.deleteAllObjectsForEntity(&error)
                do {
                    try managedObjectContext!.save()
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
                let vc = self.storyboard?.instantiateViewControllerWithIdentifier("indice") as! Indice
                self.presentViewController(vc, animated: true, completion: nil)
            }
            alertController.addAction(cancelAction)
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true) {}
            return false
        }else{
            return true
        }
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "nuevoTratamiento"){
     
        
        }
    }
    
    
    func deleteAllObjectsForEntity(error: NSErrorPointer) {
        let fetchRequest = NSFetchRequest()
        fetchRequest.fetchBatchSize = 50
        
        
        
        fetchRequest.entity = NSEntityDescription.entityForName("A1", inManagedObjectContext: managedObjectContext!)
        
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [A1]{
            if error.memory != nil {
                return
            }
            if let managedObjects = fetchResults as? [A1] {
                for object in managedObjects {
                    managedObjectContext!.deleteObject(object)
                }
            }
        }
        newItemA = NSEntityDescription.insertNewObjectForEntityForName("A1", inManagedObjectContext: managedObjectContext!) as? A1
        
        
        fetchRequest.entity = NSEntityDescription.entityForName("B1", inManagedObjectContext: managedObjectContext!)
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1]{
            if error.memory != nil {
                return
            }
            if let managedObjects = fetchResults as? [B1] {
                for object in managedObjects {
                    managedObjectContext!.deleteObject(object)
                }
            }
        }
        newItemB = NSEntityDescription.insertNewObjectForEntityForName("B1", inManagedObjectContext: managedObjectContext!) as? B1
        
        
        fetchRequest.entity = NSEntityDescription.entityForName("C1", inManagedObjectContext: managedObjectContext!)
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [C1]{
            if error.memory != nil {
                return
            }
            if let managedObjects = fetchResults as? [C1] {
                for object in managedObjects {
                    managedObjectContext!.deleteObject(object)
                }
            }
        }
        newItemC = NSEntityDescription.insertNewObjectForEntityForName("C1", inManagedObjectContext: managedObjectContext!) as? C1
        
        
        fetchRequest.entity = NSEntityDescription.entityForName("Z1", inManagedObjectContext: managedObjectContext!)
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [Z1]{
            if error.memory != nil {
                return
            }
            if let managedObjects = fetchResults as? [Z1] {
                /*
                let lastObje = (managedObjects as NSArray).lastObject as! Z1
                lastObje)
                if lastObje.deleted{
                print("Borrada")
                }else{
                print("No borrada")
                }
                */
                for object in managedObjects {
                    managedObjectContext!.deleteObject(object)
                }
            }
            newItemZ = NSEntityDescription.insertNewObjectForEntityForName("Z1", inManagedObjectContext: managedObjectContext!) as? Z1
            
        }
        do {
            try managedObjectContext!.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
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
        
        
        let BEFORE_SUBTIT=27
        let AFTER_SUBTIT=44
        let separacion = 43
        
        print("back creado!")
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        var font:UIFont = UIFont (name: "Times New Roman", size: 25)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        var y = 180;
        var textRect:CGRect = CGRectMake(10, 10, 300, 20)
        let baselineAdjust = 1.0
        let attrsDictionary =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        
        
        y = 65;
        font = UIFont (name: "Times New Roman", size: 15)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        let baselineAdj = 1.0
        let attrsDiction =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdj]
        
        for i in 0...2{
            textRect = CGRectMake(CGFloat(470), CGFloat(y), CGFloat(400), CGFloat(20))
            var PDFarray = ["dosacitric@upv.es", "Unidad de Mecanización y Tecnología Agraria", "UNIVERSITAT POLITÈCNICA DE VALÈNCIA"];
            y=y+25;
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDiction)
        }
        
        y = 65;
        
        font = UIFont (name: "Times New Roman", size: 60)!
        CGContextSetFillColorWithColor(context, UIColor.orangeColor().CGColor)
        let attrsTitulo =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let tituloArray = "DOSACITRIC"
        textRect = CGRectMake(CGFloat(70), CGFloat(y), CGFloat(800), CGFloat(60))
        tituloArray.drawInRect(textRect, withAttributes: attrsTitulo)
        
        
        y = y + BEFORE_SUBTIT
        y = y + 80
        
        font = UIFont (name: "Times New Roman", size: 25)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsA =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let AArray = "A. IDENTIFICACIÓN DEL TRATAMIENTO"
        textRect = CGRectMake(CGFloat(70), CGFloat(y), CGFloat(800), CGFloat(90))
        AArray.drawInRect(textRect, withAttributes: attrsA)
        
        y = y + AFTER_SUBTIT
        
        font = UIFont (name: "Times New Roman", size: 25)!
        for i in 0...3{
            textRect = CGRectMake(CGFloat(140), CGFloat(y), CGFloat(700), CGFloat(60))
            var PDFarray = [fechaText, idParcelaText, idTratamientoText, referenciaText];
            y=y+separacion;
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        y = y + BEFORE_SUBTIT
        
        font = UIFont (name: "Times New Roman", size: 25)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdjust]
        let BArray = "D. DETERMINACIÓN DEL VOLUMEN DE CALDO APLICADO"
        textRect = CGRectMake(CGFloat(70), CGFloat(y), CGFloat(800), CGFloat(90))
        BArray.drawInRect(textRect, withAttributes: attrsB)

        y = y + AFTER_SUBTIT
        
        for i in 0...2{
            textRect = CGRectMake(CGFloat(140), CGFloat(y), CGFloat(700), CGFloat(60))
            var PDFarray = ["Ancho de trabajo: \(anchoTextfield.text) m", "Velocidad de avance: \(velocidadTextField.text) Km/h", "Características del sistema hidráulico del equipo"];
            y=y+separacion;
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictionary)
        }
        
        
        font = UIFont (name: "Times New Roman", size: 25)!
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        let baselineAdju = 1.0
        let attrsDictiona =  [NSFontAttributeName:font, NSBaselineOffsetAttributeName:baselineAdju]
        
        
        for i in 0...9{
            textRect = CGRectMake(CGFloat(210), CGFloat(y), CGFloat(700), CGFloat(60))
            var PDFarray = ["Numero de boquillas abiertas por zona:", "                  -Zona Alta (nA): \(nATextfield.text)", "                  -Zona Media (nM): \(nMTextfield.text)", "                  -Zona Baja (nB): \(nBTextfield.text)", "Presión seleccionada: \(presionTextfield.text)",       "Boquillas seleccionadas:", "                  -Zona Alta: \(altaTextfield.text)", "                  -Zona Media: \(mediaTextfield.text)", "                  -Zona Baja: \(bajaTextfield.text)", "Caudal de líquido total del equipo (Q): \(caudalTextfield.text) L/min"];
            y=y+separacion;
            let auxiliar = PDFarray[i] as NSString
            auxiliar.drawInRect(textRect, withAttributes: attrsDictiona)
        }
        
        y = y + BEFORE_SUBTIT
        y = y + AFTER_SUBTIT
        
        let boldfont:UIFont = UIFont (name: "TimesNewRomanPS-BoldMT", size: 25)!
        font = UIFont (name: "Times New Roman", size: 25)!
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        let attrsB5 =  [NSFontAttributeName:boldfont, NSBaselineOffsetAttributeName:baselineAdjust]
        let B5Array =  "VOLUMEN DE CALDO APLICADO: \(volumenTextfield.text) L/ha"
        textRect = CGRectMake(CGFloat(170), CGFloat(y), CGFloat(800), CGFloat(90))
        B5Array.drawInRect(textRect, withAttributes: attrsB5)

        
        
        
        
    }


    
    
}

