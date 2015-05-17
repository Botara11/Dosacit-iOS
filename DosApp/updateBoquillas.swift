//
//  updateBoquillas.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 10/05/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class updateBoquillas: UIViewController {
    
let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext


let managedObjectContextC = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


func updateBoquillas() {
    
        
    let url = NSURL(string: "http://secuest.comuf.com/dosacitric/BBDD.html")
    
    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
        var result : NSString = NSString(data: data, encoding: NSUTF8StringEncoding)!
        //            println(result)
        result = result.stringByReplacingOccurrencesOfString(",", withString: ".")
        var array1 = [String]()
        var boquillas = [String]()
        var boq = [String]()
        
        array1 = (result as String).componentsSeparatedByString("<!-- Hosting24 Analytics Code -->")
        boquillas = array1[0].componentsSeparatedByString("\n")
        let count = boquillas.count
        
        for item in boquillas{
            
            boq = item.componentsSeparatedByString("%%%")
            if boq.count == 5 {
                let dbBoquillas = NSEntityDescription.insertNewObjectForEntityForName("EntityBoquillas", inManagedObjectContext: self.managedObjectContext!) as! EntityBoquillas
                
                let k = Double((boq[4] as NSString).doubleValue / pow(10,0.5))
                let dia = (boq[2] as NSString).doubleValue
                
                dbBoquillas.marca = boq[0]
                dbBoquillas.modelo = boq[1]
                dbBoquillas.diametro = dia
                dbBoquillas.caudal = (boq[4] as NSString).doubleValue
                dbBoquillas.p6 = k * pow(6,0.5)
                dbBoquillas.p7 = k * pow(7,0.5)
                dbBoquillas.p8 = k * pow(8,0.5)
                dbBoquillas.p9 = k * pow(9,0.5)
                dbBoquillas.p10 = k * pow(10,0.5)
                dbBoquillas.p11 = k * pow(11,0.5)
                dbBoquillas.p12 = k * pow(12,0.5)
                dbBoquillas.p13 = k * pow(13,0.5)
                dbBoquillas.p14 = k * pow(14,0.5)
                dbBoquillas.p15 = k * pow(15,0.5)
                dbBoquillas.p16 = k * pow(16,0.5)
                
                if(dbBoquillas.modelo=="ATR/blanca"){
                    println(" TESTE\n")
                    println("k=\(k) str=0-\(boq[0]) 1-\(boq[1]) 2-\(boq[2]) 3-\(boq[3]) 4-\(boq[4]) ")
                    println(" p6=\(dbBoquillas.p6) p7=\(dbBoquillas.p7) p8=\(dbBoquillas.p8)")
                }
                
                
            }
            
        }
        println(boquillas[0])
        /*
        let fetchRequest = NSFetchRequest(entityName: "EntityBoquillas")
        let fetchResults1 = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]
        *//*
        for var ue=0; ue<fetchResults1?.count; ue++ {
        println(fetchResults1?[ue].marca)
        println(fetchResults1?[ue].modelo)
        println(fetchResults1?[ue].caudal)
        println(fetchResults1?[ue].p6)
        println(fetchResults1?[ue].p7)
        println(fetchResults1?[ue].p16)
        
        }
        */
        
        
        /*********  AQUI EMPIEZA  **********/
        
        // Mirar: http://www.codingexplorer.com/getting-started-uitableview-swift/
        
        
        
        var marcasList: [String] = ["Teejet","Hardi","Albuz","Lechler","Discos","Otros"]
        
        //var presionList: [String] = ["p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16"]
        var presionList: [String] = ["p6"]
        let fetchRequestTest = NSFetchRequest(entityName: "EntityBoquillas")
        
        
        //            for marca in marcasList {
        //                for presion in presionList {
        //var str2 = (presion + " > %f AND " + presion + "< %f AND marca == %@"  ) as String
        //let predicateTest = NSPredicate(format: str2 , 0, 99999, marca)
        //fetchRequestTest.predicate = predicateTest
        if let fetchResultsTest = self.managedObjectContext!.executeFetchRequest(fetchRequestTest, error: nil) as? [EntityBoquillas]{
            println("AQUI EMPIEZA TEST \(fetchResultsTest.count)")
            for (var jj=0  ;jj<fetchResultsTest.count;jj++){
                if(fetchResultsTest[jj].marca=="Albuz"){
                    println("\(fetchResultsTest[jj].marca)  \(fetchResultsTest[jj].modelo) p6=\(fetchResultsTest[jj].p6) p7=\(fetchResultsTest[jj].p7) p8=\(fetchResultsTest[jj].p8) p9=\(fetchResultsTest[jj].p9) ")
                    
                }
            }
            
        }
        //                }
        //            }
        
        
        
        //if boquillas.count > 5 {
        if 0 > 5 {
            
            var marcasList: [String] = ["Teejet","Hardi","Albuz","Lechler","Discos","Otros"]
            
            var presionList: [String] = ["p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16"]
            
            let fetchRequest = NSFetchRequest(entityName: "EntityBoquillas")
            let fetchRequest2 = NSFetchRequest(entityName: "EntityBoquillas")
            let sortDescriptor = NSSortDescriptor(key: "marca", ascending: true)
            
            fetchRequest.sortDescriptors = [sortDescriptor]
            
            let intervaloCaudalAdmisible = [0.3,1.2,0.3,1.2,0.3,1.2] as [Double]
            
            for marca in marcasList {
                for presion in presionList {
                    //let predicate1 = NSPredicate(format: "(%@ >= %f) AND (%@<= %f) AND (Marca == %@)",   presion, intervaloCaudalAdmisible[0], presion, intervaloCaudalAdmisible[1], i)
                    
                    var str = (presion + " > %f AND " + presion + "< %f AND marca == %@"  ) as String
                    let predicate1 = NSPredicate(format: str , intervaloCaudalAdmisible[0], intervaloCaudalAdmisible[1], marca)
                    fetchRequest.predicate = predicate1
                    if let fetchResults1 = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]{
                        
                        str = (presion + " > %f AND " + presion + "< %f AND marca == %@") as String
                        let predicate2 = NSPredicate(format: str , intervaloCaudalAdmisible[2], intervaloCaudalAdmisible[3], marca)
                        fetchRequest.predicate = predicate2
                        if let fetchResults2 = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]{
                            
                            /*for i in fetchResults2 {
                            println(i.marca)
                            println(i.modelo)
                            println(i.p6)
                            }*/
                            str = (presion + " > %f AND " + presion + "< %f AND marca == %@") as String
                            let predicate3 = NSPredicate(format: str , intervaloCaudalAdmisible[4], intervaloCaudalAdmisible[5], marca)
                            fetchRequest.predicate = predicate3
                            if let fetchResults3 = self.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]{
                                
                                println("Todo perfectisimo")
                                
                                //Todo de la presion "presion" y de la marca "marca"
                                //fetchResults1 son boquillas adecuadas para zona Alta
                                //fetchResults2 son boquillas adecuadas para zona Media
                                //fetchResults3 son boquillas adecuadas para zona Baja
                                
                                //comprueba q hay una boq almenos en cada zona, si no hay una para cada zona no es buena
                                
                                //
                                
                            }
                        }
                    }
                }
            }
            
        }
        
        /* if  {
        logItems = fetchResults
        }
        */
        /*********  AQUI TERMINA  **********/
        
    }
    task.resume()
    /*
    pagina = (new http()).connect("http://secuest.comuf.com/dosacitric/BBDD.html");
    pagina = pagina.replace(",", ".");
    String[] nuevo = pagina.split("<!-- Hosting24 Analytics Code -->");					//*****CAMBIAR CUANDO HAYA CAMBIADO EL HOSTING*****///
    /*				pagina = nuevo[0];
    //System.out.println(pagina);
    
    String[] boquillas = pagina.split("\n");
    for(int i=0;i<boquillas.length;i++){
    String[] boq = boquillas[i].split("%%%");
    
    //HAY DATOS QUE ESTAN VACIOS "" ASI QUE NO SE PUEDE HACER DOUBLE.PARSEDOUBLE()
    Double k = Double.parseDouble(boq[4])/java.lang.Math.pow(10.0,0.5);
    //MARCA - MODELO - DIAMETRO(puede no haber) - CAUDAL
    double dia;
    if(boq[2].compareTo("")!=0){
    dia = Double.parseDouble(boq[2]);
    }else
    dia = 0.0;
    //System.out.println(boq[1] + " "+boq[4]+"/("+boq[4]+"^0,5) = " +k);
    db.addBoquilla(boq[0],boq[1],dia,Double.parseDouble(boq[4]),k*java.lang.Math.pow(6.0,0.5),
    k*java.lang.Math.pow(7.0,0.5),
    k*java.lang.Math.pow(8.0,0.5),
    k*java.lang.Math.pow(9.0,0.5),
    k*java.lang.Math.pow(10.0,0.5),
    k*java.lang.Math.pow(11.0,0.5),
    k*java.lang.Math.pow(12.0,0.5),
    k*java.lang.Math.pow(13.0,0.5),
    k*java.lang.Math.pow(14.0,0.5),
    k*java.lang.Math.pow(15.0,0.5),
    k*java.lang.Math.pow(16.0,0.5),
    1);
    }
    
    
    ArrayList<String> boquillasZ1 = db.getBoquillas("Teejet", 0.4, 0.99,"p6");
    ArrayList<String> boquillasZ2 = db.getBoquillas("Teejet", 0.4, 0.99,"p6");
    ArrayList<String> boquillasZ3 = db.getBoquillas("Teejet", 0.4, 0.99,"p6");
    if(boquillasZ1!=null && boquillasZ2!=null && boquillasZ3!=null){
    //Se muestran
    }
    else{
    //No se muestra ninguna
    }
    for(int i=0;i<boquillasZ1.size();i++)
    System.out.println(boquillasZ1.get(i));
    */*/
    
    }
}