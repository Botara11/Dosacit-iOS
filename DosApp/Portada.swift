//
//  Portada.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 22/5/16.
//  Copyright © 2016 UPV. All rights reserved.
//

import Foundation
import UIKit
import CoreData

let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

//var newItemZ = NSEntityDescription.insertNewObjectForEntityForName("Z1", inManagedObjectContext: managedObjectContext!) as! Z1
var newItemZ : Z1? = nil

//var newItemA = NSEntityDescription.insertNewObjectForEntityForName("A1", inManagedObjectContext: managedObjectContext!) as! A1
var newItemA : A1? = nil

//var newItemB = NSEntityDescription.insertNewObjectForEntityForName("B1", inManagedObjectContext: managedObjectContext!) as! B1
var newItemB : B1? = nil

//var newItemC = NSEntityDescription.insertNewObjectForEntityForName("C1", inManagedObjectContext: managedObjectContext!) as! C1
var newItemC : C1? = nil

var url : NSURL? = nil
var request : NSMutableURLRequest? = nil
var response : NSHTTPURLResponse? = nil

var data: NSMutableData? = nil
var done: (NSError?, NSData, NSString?) -> () = { (_, _, _) -> () in }



class Portada: ResponsiveTextFieldViewController, UITextFieldDelegate {
    
    @IBOutlet var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var comenzar: UIButton!
    @IBOutlet weak var nuevoTratamiento: UIButton!
    @IBOutlet weak var fondo: UIButton!
   

    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if (identifier != nil && identifier == "borrarDatos"){
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
        }
        else{
            return true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "borrarDatos"){
           
            
            
        }
        
    }
    
    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            
            progressView.setProgress(fractionalProgress, animated: animated)
            progressLabel.text = ("\(counter)%")
        }
    }
    func alert(title :String,mensaje: String){
        let alertController = UIAlertController(title: title, message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        let fetchRequest3 = NSFetchRequest(entityName: "A1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest3)) as? [A1] {
            print("Numero de boquillas A1: \(fetchResults.count)")
            if (fetchResults.count == 0){
                newItemA = NSEntityDescription.insertNewObjectForEntityForName("A1", inManagedObjectContext: managedObjectContext!) as! A1
            }else{
            newItemA=fetchResults[0]
            }
        }
        
        let fetchRequest4 = NSFetchRequest(entityName: "B1")
        if let fetchResults4 = (try? managedObjectContext!.executeFetchRequest(fetchRequest4)) as? [B1] {
            print("Numero de boquillas B1: \(fetchResults4.count)")
            if (fetchResults4.count == 0){
                newItemB = NSEntityDescription.insertNewObjectForEntityForName("B1", inManagedObjectContext: managedObjectContext!) as! B1
            }else{
            newItemB=fetchResults4[0]
            }
        }
        
        
        let fetchRequest5 = NSFetchRequest(entityName: "C1")
        if let fetchResults5 = (try? managedObjectContext!.executeFetchRequest(fetchRequest5)) as? [C1] {
            print("Numero de boquillas C1: \(fetchResults5.count)")
            if (fetchResults5.count == 0){
                newItemC = NSEntityDescription.insertNewObjectForEntityForName("C1", inManagedObjectContext: managedObjectContext!) as! C1
            }else{
                newItemC=fetchResults5[0]
            }
        }

        
        
        
        let fetchRequest7 = NSFetchRequest(entityName: "Z1")
        if let fetchResults7 = (try? managedObjectContext!.executeFetchRequest(fetchRequest7)) as? [Z1] {
            print("Numero de boquillas Z1: \(fetchResults7.count)")
            if (fetchResults7.count == 0){
                newItemZ = NSEntityDescription.insertNewObjectForEntityForName("Z1", inManagedObjectContext: managedObjectContext!) as! Z1
            }else{
                newItemZ=fetchResults7[0]
            }
        }

        
    }
    override func viewDidAppear(animated: Bool) {
        
        var nboq = 0
        let fetchRequest3 = NSFetchRequest(entityName: "EntityBoquillas")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest3)) as? [EntityBoquillas] {
            print("Numero de boquillas: \(fetchResults.count)")
            nboq=fetchResults.count
        }
        
        print("HolaHolaHola:  \(nboq)")
        if (nboq == 0 ){
            let nuevo : updateBoquillas = updateBoquillas()
            nuevo.updateBoquillas()
            progressView.setProgress(0, animated: true)
            progressLabel.text = "0%"
            self.counter = 0
            for i in 0..<100 {
                if (i != 99){
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                        sleep(1)
                        dispatch_async(dispatch_get_main_queue(), {
                            self.counter++
                            return
                        })
                    })
                }
                else{
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                        sleep(1)
                        dispatch_async(dispatch_get_main_queue(), {
                            self.counter++
                            var otro = 0
                            let fetchRequest3 = NSFetchRequest(entityName: "EntityBoquillas")
                            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest3)) as? [EntityBoquillas] {
                                print("Numero de boquillas: \(fetchResults.count)")
                                otro=fetchResults.count
                            }
                            print("Otro : \(otro)")
                            if (otro == 0 ){
                                self.alert("ERROR",mensaje: "No se ha podido conectar conservidor, por favor revise que su dispositivo tiene conexion a internet")
                                
                                //progressLabel.hidden = true
                                self.progressLabel.text = "ERROR"
                                self.progressView.hidden = true
                                //nuevoTratamiento.hidden = true
                                //comenzar.hidden = true
                                //fondo.hidden = true
                                
                                
                            }else{
                                self.progressLabel.hidden = true
                                self.progressView.hidden = true
                            }
                            
                            return
                        })
                    })
                }
            }
        }
        else {
            progressLabel.hidden = true
            progressView.hidden = true
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
        newItemA = NSEntityDescription.insertNewObjectForEntityForName("A1", inManagedObjectContext: managedObjectContext!) as! A1
        
        
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
        newItemB = NSEntityDescription.insertNewObjectForEntityForName("B1", inManagedObjectContext: managedObjectContext!) as! B1
        
        
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
        newItemC = NSEntityDescription.insertNewObjectForEntityForName("C1", inManagedObjectContext: managedObjectContext!) as! C1
        
        
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
            newItemZ = NSEntityDescription.insertNewObjectForEntityForName("Z1", inManagedObjectContext: managedObjectContext!) as! Z1
            
        }
        do {
            try managedObjectContext!.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
        
    }
    
    
    
}


