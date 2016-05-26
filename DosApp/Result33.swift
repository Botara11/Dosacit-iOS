//
//  Result33.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 08/05/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//


import UIKit
import Foundation
import CoreData





class Result33: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var marca = String()
    var presion = String()
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    
    var selSeccion0 = Int()
    var selSeccion1 = Int()
    var selSeccion2 = Int()
    
    
    var modeloZonaAlta = String()
    var modeloZonaMedia = String()
    var modeloZonaBaja = String()
    
    
    @IBOutlet var tableView: UITableView!
    
    
    let collation = UILocalizedIndexedCollation.currentCollation()
        
    
    
    var cadena = [String]()
    var sections = [Section]()
    
    func estaEnCadena(item:String)->Bool{
        for aux in cadena{
            if aux==item{
                return true
            }
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = true
        let fetchRequest2 = NSFetchRequest(entityName: "C1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest2)) as? [C1] {
            print("Result33 Objetos: \(fetchResults.count)")
            newItemC = fetchResults[0]
            presion=fetchResults[0].presion
            marca=fetchResults[0].marca
            
        }
        
        
        /*
        selSeccion0=0
        selSeccion1=0
        selSeccion2=0
        */
        var path = NSIndexPath(forItem: 2, inSection: 0)
        var se = Section()
        sections.append(Section())
        sections.append(Section())
        sections.append(Section())
        let str = ("marca == %@") as String
        let predicate1 = NSPredicate(format: str , marca)
        let fetchRequest = NSFetchRequest(entityName: "EntityBoquillas")
        fetchRequest.predicate = predicate1
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [EntityBoquillas]{
            for fe in fetchResults{
                //Aqui habria que diferenciar entre zona1 zona2 y zona3
                //cadena.append(fe.modelo)
                //self.tableData.append(fe.modelo)
                self.sections[0].addBoq(fe.modelo)
                print("alta \(fe.modelo)")
                
                self.sections[1].addBoq(fe.modelo)
                print("media \(fe.modelo)")
                
                self.sections[2].addBoq(fe.modelo)
                print("baja \(fe.modelo)")

            }
        }
        
        
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.reloadData()
        
        //tableView.removeFromSuperview()
        
        
        modeloZonaAlta = sections[0].boquis[0]
        modeloZonaMedia = sections[1].boquis[0]
        modeloZonaBaja = sections[2].boquis[0]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("Seccion \(section) hay \(self.sections[section].boquis.count)")
        return self.sections[section].boquis.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier)! as UITableViewCell
        
        //cell.textLabel?.text = self.tableData[indexPath.row]
        cell.textLabel?.text = self.sections[indexPath.section].boquis[indexPath.row]
        //print("secc=\(indexPath.section) item=\(indexPath.item) seleccionado=\(selSeccion0) \(self.sections[indexPath.section].boquis[indexPath.item])")
        switch(indexPath.section){
        case 0:
            if (indexPath.item == selSeccion0){
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.None
            }
            break
        case 1:
            if (indexPath.item == selSeccion1){
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.None
            }
            break
        case 2:
            if (indexPath.item == selSeccion2){
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.None
            }
            break
        default:
            break
        }
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView2: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        
        
        //tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text="XXXXXXX"
        //tableView.cellForRowAtIndexPath(indexPath)?.selected = false
        print("Ha sido sele: \(indexPath.section) \(indexPath.item)")
        switch(indexPath.section){
        case 0:
            modeloZonaAlta = self.sections[indexPath.section].boquis[indexPath.item]
            selSeccion0 = indexPath.item
            break
        case 1:
            modeloZonaMedia = self.sections[indexPath.section].boquis[indexPath.item]
            selSeccion1 = indexPath.item
            break
        case 2:
            modeloZonaBaja = self.sections[indexPath.section].boquis[indexPath.item]
            selSeccion2 = indexPath.item
            break
        default:
            break
        }
        tableView.reloadData()
    }
    
    
    // print the date as the section header title
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section==0){
            return "Zona Alta"
        }
        if(section==1){
            return "Zona Media"
        }
        if(section==2){
            return "Zona Baja"
        }
        return "HOLA BEBE"
    }
    
    
    
    
    class Section {
        var boquis: [String] = []
        
        func addBoq(boq: String) {
            self.boquis.append(boq)
        }
    }
    
    
    func saveCaudalXZona(selSecc: Int) -> Double {
        
        let str = ("modelo == %@ AND marca == %@") as String
        let predicate1 = NSPredicate(format: str , self.sections[0].boquis[selSecc], marca)
        let fetchRequest = NSFetchRequest(entityName: "EntityBoquillas")
        fetchRequest.predicate = predicate1
        var caudal = Double()
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [EntityBoquillas]{
            for fe in fetchResults{
                
                switch(presion){
                case "p6":
                    caudal=fe.p6
                    break
                case "p7":
                    caudal=fe.p7
                    break
                case "p8":
                    caudal=fe.p8
                    break
                case "p9":
                    caudal=fe.p9
                    break
                case "p10":
                    caudal=fe.p10
                    break
                case "p11":
                    caudal=fe.p11
                    break
                case "p12":
                    caudal=fe.p12
                    break
                case "p13":
                    caudal=fe.p13
                    break
                case "p14":
                    caudal=fe.p14
                    break
                case "p15":
                    caudal=fe.p15
                    break
                case "p16":
                    caudal=fe.p16
                    break
                default:
                    caudal=0.0
                }
            }
        }
        return caudal
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){
        
        if(segue.identifier == "C33"){
            let fetchRequest2 = NSFetchRequest(entityName: "C1")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest2)) as? [C1] {
                
                fetchResults[0].caudalZonaAlta = saveCaudalXZona(selSeccion0)
                fetchResults[0].caudalZonaMedia = saveCaudalXZona(selSeccion1)
                fetchResults[0].caudalZonaBaja = saveCaudalXZona(selSeccion2)
                
                
                
                fetchResults[0].nombreZonaAlta = modeloZonaAlta
                fetchResults[0].nombreZonaMedia = modeloZonaMedia
                fetchResults[0].nombreZonaBaja = modeloZonaBaja
                
                print(fetchResults[0].caudalZonaAlta)
                
                do {
                    try managedObjectContext!.save()
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
}
