//
//  SelecBoquillas3.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 20/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import CoreData

class SelecBoquillas3: UIViewController {
    
    var caract2 = ParteB()
    
    @IBOutlet var IntervaloCaudalAdmisibleAlta: UITextView!
    @IBOutlet var IntervaloCaudalAdmisibleMedia: UITextView!
    @IBOutlet var IntervaloCaudalAdmisibleBaja: UITextView!
    
    
    @IBOutlet var VariacionText: UITextView!
    @IBOutlet var VariacionCaudal: UISlider!
    
    @IBAction func SliderVariacionCaudal(sender: AnyObject) {

        var CurrentValue = Int(VariacionCaudal.value)
        VariacionText.text = "\(CurrentValue)"
        newItemB.variacionCaudalAdmisible = Double(CurrentValue)
        caract2.calcularParteB()
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
            IntervaloCaudalAdmisibleAlta.text = "\(fetchResults[0].caudalLiquidoBoquillaAlta)"
            IntervaloCaudalAdmisibleMedia.text = "\(fetchResults[0].caudalLiquidoBoquillaMedia)"
            IntervaloCaudalAdmisibleBaja.text = "\(fetchResults[0].caudalLiquidoBoquillaBaja)"
            
            
        }
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        var intervaloCaudalAdmisible = [0.3,1.2,0.3,1.2,0.3,1.2] as [Double]
        
        let fetchRequest999 = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest999, error: nil) as? [B1] {
            intervaloCaudalAdmisible[0] = fetchResults[0].intervaloCaudalAdmisible0
            intervaloCaudalAdmisible[1] = fetchResults[0].intervaloCaudalAdmisible1
            intervaloCaudalAdmisible[2] = fetchResults[0].intervaloCaudalAdmisible2
            intervaloCaudalAdmisible[3] = fetchResults[0].intervaloCaudalAdmisible3
            intervaloCaudalAdmisible[4] = fetchResults[0].intervaloCaudalAdmisible4
            intervaloCaudalAdmisible[5] = fetchResults[0].intervaloCaudalAdmisible5
            println("\(intervaloCaudalAdmisible[0])-\(intervaloCaudalAdmisible[1]) _ \(intervaloCaudalAdmisible[2])-\(intervaloCaudalAdmisible[3]) _ \(intervaloCaudalAdmisible[4])-\(intervaloCaudalAdmisible[5]) ")
        }
        
        
        
        var managedObjectContext : NSManagedObjectContext? = {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            if let managedObjectContext = appDelegate.managedObjectContext {
                return managedObjectContext
            }
            else {
                return nil
            }
            }()
        
        
        
        var marcasList: [String] = ["Teejet","Hardi","Albuz","Lechler","Discos","Otros"]
        
        var presionList: [String] = ["p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16"]
        
        let fetchRequest = NSFetchRequest(entityName: "EntityBoquillas")
        let fetchRequest2 = NSFetchRequest(entityName: "EntityBoquillas")
        let sortDescriptor = NSSortDescriptor(key: "marca", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // let intervaloCaudalAdmisible = [0.78,0.87,0.78,0.87,0.39,0.43] as [Double]
        
        
        
        for marca in marcasList {
            for presion in presionList {
                //let predicate1 = NSPredicate(format: "(%@ >= %f) AND (%@<= %f) AND (Marca == %@)",   presion, intervaloCaudalAdmisible[0], presion, intervaloCaudalAdmisible[1], i)
                
                var str = (presion + " > %f AND " + presion + "< %f AND marca == %@"  ) as String
                let predicate1 = NSPredicate(format: str , intervaloCaudalAdmisible[0], intervaloCaudalAdmisible[1], marca)
                fetchRequest.predicate = predicate1
                if let fetchResults1 = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]{
                    //var al = (fetchResults1 as [EntityBoquillas])[0].marca
                    //println(al)
                    
                    str = (presion + " > %f AND " + presion + "< %f AND marca == %@") as String
                    let predicate2 = NSPredicate(format: str , intervaloCaudalAdmisible[2], intervaloCaudalAdmisible[3], marca)
                    fetchRequest.predicate = predicate2
                    if let fetchResults2 = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]{
                        
                        /*for i in fetchResults2 {
                        println(i.marca)
                        println(i.modelo)
                        println(i.p6)
                        }*/
                        str = (presion + " >= %f AND " + presion + "<= %f AND marca == %@") as String
                        let predicate3 = NSPredicate(format: str , intervaloCaudalAdmisible[4], intervaloCaudalAdmisible[5], marca)
                        fetchRequest.predicate = predicate3
                        if let fetchResults3 = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]{
                            
                            println("Todo perfectisimo \(fetchResults1.count) \(fetchResults2.count) \(fetchResults3.count) de \(marca) en \(presion)")
                            
                            if(fetchResults1.count>0 && fetchResults2.count>0 && fetchResults3.count>0 ){
                                
                                let newItem = NSEntityDescription.insertNewObjectForEntityForName("FiltroBoquillas", inManagedObjectContext: managedObjectContext!) as! FiltroBoquillas
                                let newItem2 = NSEntityDescription.insertNewObjectForEntityForName("FiltroBoquillas", inManagedObjectContext: managedObjectContext!) as! FiltroBoquillas
                                let newItem3 = NSEntityDescription.insertNewObjectForEntityForName("FiltroBoquillas", inManagedObjectContext: managedObjectContext!) as! FiltroBoquillas
                                let min = minimo(fetchResults1.count,b:fetchResults2.count,c:fetchResults3.count)
                                for var r=0; r<min; r=r+1 {
                                    newItem.marca = marca
                                    newItem.presion = presion
                                    newItem.modelo = fetchResults1[r].modelo
                                    newItem.zona = "alta"
                                    
                                    newItem2.marca = marca
                                    newItem2.presion = presion
                                    newItem2.modelo = fetchResults2[r].modelo
                                    newItem2.zona = "media"
                                    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VariacionCaudal.maximumValue = 10.0
        VariacionCaudal.value = 3.0
        VariacionText.text = "\(3)"
        newItemB.variacionCaudalAdmisible = 5;
        caract2.calcularParteB()
        // Do any additional setup after loading the view, typically from a nib.
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            IntervaloCaudalAdmisibleAlta.text = "\(fetchResults[0].caudalLiquidoBoquillaAlta)"
            IntervaloCaudalAdmisibleMedia.text = "\(fetchResults[0].caudalLiquidoBoquillaMedia)"
            IntervaloCaudalAdmisibleBaja.text = "\(fetchResults[0].caudalLiquidoBoquillaBaja)"
        }
    }
    
    
    func minimo (a:Int, b:Int, c:Int)-> Int{
        if(a<b && a<c) {
            return a}
        else if (b<a && b<c){
            return b}
        else {
            return c
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
