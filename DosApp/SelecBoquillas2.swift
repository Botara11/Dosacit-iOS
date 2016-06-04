//
//  SelecBoquillas2.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 14/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

class SelecBoquillas2: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet var NumBoqCerrAlta: UITextField!
    @IBOutlet var NumBoqCerrBaja: UITextField!
    @IBOutlet var NumBoqAbAlta: UITextField!
    @IBOutlet var NumBoqAbMedia: UITextField!
    @IBOutlet var NumBoqAbBaja: UITextField!
    @IBOutlet var PorcentajeVegAlta: UITextField!
    @IBOutlet var PorcentajeVegMedia: UITextField!
    @IBOutlet var PorcentajeVegBaja: UITextField!
    
    
    var caract2 = ParteB()
    
    @IBOutlet var IntervaloCaudalAdmisibleAlta: UITextView!
    @IBOutlet var IntervaloCaudalAdmisibleMedia: UITextView!
    @IBOutlet var IntervaloCaudalAdmisibleBaja: UITextView!
    
    
    @IBOutlet var VariacionText: UITextView!
    @IBOutlet var VariacionCaudal: UISlider!
    
    
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
    
    @IBAction func SliderVariacionCaudal(sender: AnyObject) {
        
        do {
            try managedObjectContext!.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        print("Antes:  \(NumBoqAbAlta.text! as NSString).integerValue) + \(NumBoqAbMedia.text! as NSString).integerValue) + \(NumBoqAbBaja.text! as NSString).integerValue) != \(newItemB!.numeroTotalBoquillas)")
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
            
            let CurrentValue = Int(VariacionCaudal.value)
            VariacionText.text = "\(CurrentValue)"
            newItemB!.variacionCaudalAdmisible = Double(CurrentValue)
            if NumBoqCerrAlta.text == "" || NumBoqCerrBaja.text == "" || NumBoqAbAlta.text == "" || NumBoqAbBaja.text == "" || NumBoqAbMedia.text == "" || PorcentajeVegAlta.text == "" || PorcentajeVegBaja == "" || PorcentajeVegMedia.text == "" {
                
                alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
                
            }else if (((PorcentajeVegAlta.text! as NSString).integerValue) + (PorcentajeVegMedia.text! as NSString).integerValue + (PorcentajeVegBaja.text! as NSString).integerValue != 100 ){
                
                alert("ERROR",mensaje: "La suma del porcentaje de vegetación a pulverizar no es igual al 100%")
            }else if(((NumBoqAbAlta.text! as NSString).integerValue + (NumBoqAbMedia.text! as NSString).integerValue + (NumBoqAbBaja.text! as NSString).integerValue + (NumBoqCerrAlta.text! as NSString).integerValue + (NumBoqCerrBaja.text! as NSString).integerValue) != fetchResults[0].numeroTotalBoquillas ){
                
                
                print("\(NumBoqAbAlta.text! as NSString).integerValue) + \(NumBoqAbMedia.text! as NSString).integerValue) + \(NumBoqAbBaja.text! as NSString).integerValue) != \(newItemB!.numeroTotalBoquillas)")
                
                
                alert("ERROR",mensaje: "La suma entre las boquillas abiertas y cerradas debe ser igual al número total de boquillas")
                
            }else{
                
                newItemB!.numeroBoquillasCerradasAlta = (NumBoqCerrAlta.text! as NSString).integerValue
                
                newItemB!.numeroBoquillasCerradasBaja = (NumBoqCerrBaja.text! as NSString).integerValue
                
                newItemB!.numeroBoquillasAbiertasAlta = (NumBoqAbAlta.text! as NSString).integerValue
                
                newItemB!.numeroBoquillasAbiertasMedia = (NumBoqAbMedia.text! as NSString).integerValue
                
                newItemB!.numeroBoquillasAbiertasBaja = (NumBoqAbBaja.text! as NSString).integerValue
                
                newItemB!.porcentajeVegetacionAlta = (PorcentajeVegAlta.text! as NSString).integerValue
                
                newItemB!.porcentajeVegetacionMedia = (PorcentajeVegMedia.text! as NSString).integerValue
                
                newItemB!.porcentajeVegetacionBaja = (PorcentajeVegBaja.text! as NSString).integerValue
            }
        }
        caract2.calcularParteB()
        
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
            
            IntervaloCaudalAdmisibleAlta.text = String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible0)+" - "+String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible1)
            IntervaloCaudalAdmisibleMedia.text = String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible2)+" - "+String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible3)
            IntervaloCaudalAdmisibleBaja.text = String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible4)+" - "+String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible5)
            
            
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        newItemB!.variacionCaudalAdmisible = Double(VariacionCaudal.value)
        newItemB!.numeroBoquillasCerradasAlta = (NumBoqCerrAlta.text! as NSString).integerValue
        newItemB!.numeroBoquillasCerradasBaja = (NumBoqCerrBaja.text! as NSString).integerValue
        newItemB!.numeroBoquillasAbiertasAlta = (NumBoqAbAlta.text! as NSString).integerValue
        newItemB!.numeroBoquillasAbiertasMedia = (NumBoqAbMedia.text! as NSString).integerValue
        newItemB!.numeroBoquillasAbiertasBaja = (NumBoqAbBaja.text! as NSString).integerValue
        newItemB!.porcentajeVegetacionAlta = (PorcentajeVegAlta.text! as NSString).integerValue
        newItemB!.porcentajeVegetacionMedia = (PorcentajeVegMedia.text! as NSString).integerValue
        newItemB!.porcentajeVegetacionBaja = (PorcentajeVegBaja.text! as NSString).integerValue
        
        do {
            try managedObjectContext!.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        print("Antes:  \(NumBoqAbAlta.text! as NSString).integerValue) + \(NumBoqAbMedia.text! as NSString).integerValue) + \(NumBoqAbBaja.text! as NSString).integerValue) != \(newItemB!.numeroTotalBoquillas)")
        
        
        if(segue.identifier == "B23"){
            caract2.calcularParteB()
            
            var intervaloCaudalAdmisible = [0.3,1.2,0.3,1.2,0.3,1.2] as [Double]
            intervaloCaudalAdmisible[0] = newItemB!.intervaloCaudalAdmisible0
            intervaloCaudalAdmisible[1] = newItemB!.intervaloCaudalAdmisible1
            intervaloCaudalAdmisible[2] = newItemB!.intervaloCaudalAdmisible2
            intervaloCaudalAdmisible[3] = newItemB!.intervaloCaudalAdmisible3
            intervaloCaudalAdmisible[4] = newItemB!.intervaloCaudalAdmisible4
            intervaloCaudalAdmisible[5] = newItemB!.intervaloCaudalAdmisible5
            print("\(intervaloCaudalAdmisible[0])-\(intervaloCaudalAdmisible[1]) _ \(intervaloCaudalAdmisible[2])-\(intervaloCaudalAdmisible[3]) _ \(intervaloCaudalAdmisible[4])-\(intervaloCaudalAdmisible[5]) ")
            
            if NumBoqCerrAlta.text == "" || NumBoqCerrBaja.text == "" || NumBoqAbAlta.text == "" || NumBoqAbBaja.text == "" || NumBoqAbMedia.text == "" || PorcentajeVegAlta.text == "" || PorcentajeVegBaja == "" || PorcentajeVegMedia.text == "" {
                
                alert("ERROR",mensaje: "No puede haber campos vacíos y deben ser valores numéricos")
                
            }else if (((PorcentajeVegAlta.text! as NSString).integerValue) + (PorcentajeVegMedia.text! as NSString).integerValue + (PorcentajeVegBaja.text! as NSString).integerValue != 100 ){
                
                alert("ERROR",mensaje: "La suma del porcentaje de vegetación a pulverizar no es igual al 100%")
            }else if(((NumBoqAbAlta.text! as NSString).integerValue + (NumBoqAbMedia.text! as NSString).integerValue + (NumBoqAbBaja.text! as NSString).integerValue + (NumBoqCerrAlta.text! as NSString).integerValue + (NumBoqCerrBaja.text! as NSString).integerValue) != newItemB!.numeroTotalBoquillas ){
                print("\(NumBoqAbAlta.text! as NSString).integerValue) + \(NumBoqAbMedia.text! as NSString).integerValue) + \(NumBoqAbBaja.text! as NSString).integerValue) != \(newItemB!.numeroTotalBoquillas)")
                
                alert("ERROR",mensaje: "La suma entre las boquillas abiertas y cerradas debe ser igual al número total de boquillas")
                
            }
            
            
            
            let marcasList: [String] = ["Teejet","Hardi","Albuz","Lechler","Discos","Otros"]
            
            let presionList: [String] = ["p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16"]
            
            
            let sortDescriptor = NSSortDescriptor(key: "marca", ascending: true)
            let buscarBoquillas = NSFetchRequest(entityName: "EntityBoquillas")
            
            buscarBoquillas.sortDescriptors = [sortDescriptor]
            
            // let intervaloCaudalAdmisible = [0.78,0.87,0.78,0.87,0.39,0.43] as [Double]
            var error: NSError?
            deleteAllObjectsForEntity(&error)
            print("EL error\(error)")
            
            for marca in marcasList {
                for presion in presionList {
                    //let predicate1 = NSPredicate(format: "(%@ >= %f) AND (%@<= %f) AND (Marca == %@)",   presion, intervaloCaudalAdmisible[0], presion, intervaloCaudalAdmisible[1], i)
                    
                    var str = (presion + " > %f AND " + presion + "< %f AND marca == %@"  ) as String
                    let predicate1 = NSPredicate(format: str , intervaloCaudalAdmisible[0], intervaloCaudalAdmisible[1], marca)
                    buscarBoquillas.predicate = predicate1
                    if let fetchResults1 = (try? managedObjectContext!.executeFetchRequest(buscarBoquillas)) as? [EntityBoquillas]{
                        //var al = (fetchResults1 as [EntityBoquillas])[0].marca
                        //println(al)
                        
                        str = (presion + " > %f AND " + presion + "< %f AND marca == %@") as String
                        let predicate2 = NSPredicate(format: str , intervaloCaudalAdmisible[2], intervaloCaudalAdmisible[3], marca)
                        buscarBoquillas.predicate = predicate2
                        if let fetchResults2 = (try? managedObjectContext!.executeFetchRequest(buscarBoquillas)) as? [EntityBoquillas]{
                            
                            /*for i in fetchResults2 {
                            println(i.marca)
                            println(i.modelo)
                            println(i.p6)
                            }*/
                            
                            print("\(marca):\(presion)")
                            
                            str = (presion + " >= %f AND " + presion + "<= %f AND marca == %@") as String
                            let predicate3 = NSPredicate(format: str , intervaloCaudalAdmisible[4], intervaloCaudalAdmisible[5], marca)
                            buscarBoquillas.predicate = predicate3
                            if let fetchResults3 = (try? managedObjectContext!.executeFetchRequest(buscarBoquillas)) as? [EntityBoquillas]{
                                
                                print("Todo perfectisimo \(fetchResults1.count) \(fetchResults2.count) \(fetchResults3.count) de \(marca) en \(presion)")
                                
                                if(fetchResults1.count>0 && fetchResults2.count>0 && fetchResults3.count>0 ){
                                    
                                    //let min = minimo(fetchResults1.count,b:fetchResults2.count,c:fetchResults3.count)
                                    
                                    for var r=0; r<fetchResults1.count; r=r+1 {
                                        let newItem = NSEntityDescription.insertNewObjectForEntityForName("FiltroBoquillas", inManagedObjectContext: managedObjectContext!) as! FiltroBoquillas
                                        
                                        newItem.marca = marca
                                        newItem.presion = presion
                                        newItem.modelo = fetchResults1[r].modelo
                                        newItem.zona = "alta"
                                    }
                                    for var r=0; r<fetchResults2.count;r=r+1{
                                        let newItem2 = NSEntityDescription.insertNewObjectForEntityForName("FiltroBoquillas", inManagedObjectContext: managedObjectContext!) as! FiltroBoquillas
                                        
                                        newItem2.marca = marca
                                        newItem2.presion = presion
                                        newItem2.modelo = fetchResults2[r].modelo
                                        newItem2.zona = "media"
                                    }
                                    for var r=0; r<fetchResults3.count;r=r+1{
                                        let newItem3 = NSEntityDescription.insertNewObjectForEntityForName("FiltroBoquillas", inManagedObjectContext: managedObjectContext!) as! FiltroBoquillas
                                        
                                        newItem3.marca = marca
                                        newItem3.presion = presion
                                        newItem3.modelo = fetchResults3[r].modelo
                                        newItem3.zona = "baja"
                                    }
                                    
                                }
                            }
                        }
                    }
                } //Fin presion
            } //Fin marca
            
        }
        do {
            try managedObjectContext!.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NumBoqCerrAlta.tag = 0
        NumBoqCerrBaja.tag = 1
        NumBoqAbAlta.tag = 2
        NumBoqAbMedia.tag = 3
        NumBoqAbBaja.tag = 4
        PorcentajeVegAlta.tag = 5
        PorcentajeVegMedia.tag = 6
        PorcentajeVegBaja.tag = 7
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
            print("SelecBoquill2 Objetos: \(fetchResults.count)")
            newItemB = fetchResults[0]
            
            IntervaloCaudalAdmisibleAlta.text = String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible0)+" - "+String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible1)
            IntervaloCaudalAdmisibleMedia.text = String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible2)+" - "+String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible3)
            IntervaloCaudalAdmisibleBaja.text = String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible4)+" - "+String(format:"%.2f",fetchResults[0].intervaloCaudalAdmisible5)
            VariacionText.text = String(format:"%.0f",round(fetchResults[0].variacionCaudalAdmisible))
            VariacionCaudal.value = (fetchResults[0].variacionCaudalAdmisible as NSNumber).floatValue * 100
            print("\(fetchResults[0].variacionCaudalAdmisible)")
            
            
            NumBoqCerrAlta.keyboardType = UIKeyboardType.NumbersAndPunctuation
            NumBoqCerrBaja.keyboardType = UIKeyboardType.NumbersAndPunctuation
            NumBoqAbAlta.keyboardType = UIKeyboardType.NumbersAndPunctuation
            NumBoqAbMedia.keyboardType = UIKeyboardType.NumbersAndPunctuation
            NumBoqAbBaja.keyboardType = UIKeyboardType.NumbersAndPunctuation
            PorcentajeVegAlta.keyboardType = UIKeyboardType.NumbersAndPunctuation
            PorcentajeVegMedia.keyboardType = UIKeyboardType.NumbersAndPunctuation
            PorcentajeVegBaja.keyboardType = UIKeyboardType.NumbersAndPunctuation
            
            
            
            
            if (fetchResults[0].numeroBoquillasAbiertasAlta != 0){
                NumBoqAbAlta.text = "\(fetchResults[0].numeroBoquillasAbiertasAlta)"
            }
            
            if (fetchResults[0].numeroBoquillasAbiertasBaja != 0){
                NumBoqAbBaja.text = "\(fetchResults[0].numeroBoquillasAbiertasBaja)"
            }
            
            if (fetchResults[0].numeroBoquillasAbiertasMedia != 0){
                NumBoqAbMedia.text = "\(fetchResults[0].numeroBoquillasAbiertasMedia)"
            }
            if (fetchResults[0].porcentajeVegetacionAlta != 0){
                PorcentajeVegAlta.text = "\(fetchResults[0].porcentajeVegetacionAlta)"
            }
            if (fetchResults[0].porcentajeVegetacionBaja != 0){
                PorcentajeVegBaja.text = "\(fetchResults[0].porcentajeVegetacionBaja)"
            }
            if (fetchResults[0].porcentajeVegetacionMedia != 0){
                PorcentajeVegMedia.text = "\(fetchResults[0].porcentajeVegetacionMedia)"
            }
            if (NumBoqAbAlta.text == ""){
                NumBoqCerrAlta.text = ""
            }else{
                NumBoqCerrAlta.text = "\(fetchResults[0].numeroBoquillasCerradasAlta)"
            }
            if (NumBoqAbAlta.text == ""){
                NumBoqCerrBaja.text = ""
            }else{
                NumBoqCerrBaja.text = "\(fetchResults[0].numeroBoquillasCerradasBaja)"
            }

            
        }
    }
    
    
    func alert(title :String,mensaje: String){
        let alertController = UIAlertController(title: title, message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func minimo (a:Int, b:Int, c:Int)-> Int{
        if(a<=b && a<=c) {
            return a}
        else if (b<=a && b<=c){
            return b}
        else {
            return c
        }
    }
    
    
    func deleteAllObjectsForEntity(error: NSErrorPointer) {
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = NSEntityDescription.entityForName("FiltroBoquillas", inManagedObjectContext: managedObjectContext!)
        fetchRequest.fetchBatchSize = 50
        //        if let fetchResults = (try? managedObjectContextB!.executeFetchRequest(fetchRequest)) as? [B1] {
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [FiltroBoquillas]{
            //let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest)
            
            if error.memory != nil {
                return
            }
            
            if let managedObjects = fetchResults as? [FiltroBoquillas] {
                for object in managedObjects {
                    managedObjectContext!.deleteObject(object)
                }
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
