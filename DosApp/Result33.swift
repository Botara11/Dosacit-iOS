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
    
    
    
    @IBOutlet var tableView: UITableView!
    
    
    let collation = UILocalizedIndexedCollation.currentCollation()
        as! UILocalizedIndexedCollation
    
    
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
        var str = ("marca == %@") as String
        let predicate1 = NSPredicate(format: str , marca)
        let fetchRequest = NSFetchRequest(entityName: "EntityBoquillas")
        fetchRequest.predicate = predicate1
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [EntityBoquillas]{
            for fe in fetchResults{
                //Aqui habria que diferenciar entre zona1 zona2 y zona3
                //cadena.append(fe.modelo)
                //self.tableData.append(fe.modelo)
                    self.sections[0].addBoq(fe.modelo)
                    //println("alta \(fe.modelo)")

                    self.sections[1].addBoq(fe.modelo)
                    //println("media \(fe.modelo)")
                
                    self.sections[2].addBoq(fe.modelo)
                    //println("baja \(fe.modelo)")
            }
        }

        
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.reloadData()
        tableView.cellForRowAtIndexPath(path)?.textLabel?.text="XXXXXXX"

        //tableView.removeFromSuperview()
        
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
        println("Seccion \(section) hay \(self.sections[section].boquis.count)")
        return self.sections[section].boquis.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as! UITableViewCell
        
        //cell.textLabel?.text = self.tableData[indexPath.row]
        cell.textLabel?.text = self.sections[indexPath.section].boquis[indexPath.row]
        println("secc=\(indexPath.section) item=\(indexPath.item)")
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
        switch(indexPath.section){
        case 0:
            selSeccion0 = indexPath.item
            break
        case 1:
            selSeccion1 = indexPath.item
            break
        case 2:
            selSeccion2 = indexPath.item
            break
        default:
            break
        }
        tableView.reloadData()

        // let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("res2")
        // self.showViewController(vc as! UIViewController, sender: vc)
        
       // var selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        //selectedCell.contentView.backgroundColor = UIColor.redColor()
        
        
        
        //selectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark

//        selectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
//        tableView.cellForRowAtIndexPath(indexPath: NSIndexPath)
        
        //var path = NSIndexPath(forItem: 2, inSection: indexPath.section)
        //var celda = self.tableView.cellForRowAtIndexPath(path)
        //celda!.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton

        //println("(\(path.item),\(path.section)) -> \(self.tableView.cellForRowAtIndexPath(path)?.textLabel?.text)" )
        /*
        path = NSIndexPath(forItem: 2, inSection: 1)
        celda = tableView2.cellForRowAtIndexPath(path)
        celda!.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        
        println("(\(path.item),\(path.section)) -> \(tableView2.cellForRowAtIndexPath(path)?.textLabel?.text)" )
        
        path = NSIndexPath(forItem: 2, inSection: 2)
        celda = self.tableView.cellForRowAtIndexPath(path)
        celda!.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        
        println("(\(path.item),\(path.section)) -> \(self.tableView.cellForRowAtIndexPath(path)?.textLabel?.text)" )
        
*/
        //self.tableView.reloadData()
        //tableView.cellForRowAtIndexPath(tableView.indexPathForSelectedRow()!)?.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        /*
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
        }))

        self.presentViewController(alert, animated: true, completion: nil)
        */
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
}
