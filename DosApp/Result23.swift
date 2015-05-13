//
//  Result23.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 14/04/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//


import UIKit
import Foundation
import CoreData





class Result23: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var marca = String()
    var presion = String()
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    
    
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
        var se = Section()
        sections.append(Section())
        sections.append(Section())
        sections.append(Section())
        var str = ("marca == %@ AND presion == %@") as String
        let predicate1 = NSPredicate(format: str , marca, presion)
        let fetchRequest = NSFetchRequest(entityName: "FiltroBoquillas")
        fetchRequest.predicate = predicate1
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [FiltroBoquillas]{
            for fe in fetchResults{
                    //Aqui habria que diferenciar entre zona1 zona2 y zona3
                    //cadena.append(fe.modelo)
                    //self.tableData.append(fe.modelo)
                if fe.zona == "alta" {
                    self.sections[0].addBoq(fe.modelo)
                    println("alta \(fe.modelo)")
                }
                if fe.zona == "media" {
                    self.sections[1].addBoq(fe.modelo)
                    println("media \(fe.modelo)")
                }
                if fe.zona == "baja" {
                    self.sections[2].addBoq(fe.modelo)
                    println("baja \(fe.modelo)")
                }
            }
        }
        
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.reloadData()
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
        return cell
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        
       // let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("res2")
       // self.showViewController(vc as! UIViewController, sender: vc)
        
        
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
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
/*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "Result23"){
            let vc = segue.destinationViewController as! Result23
            vc.marca = marca
            var auxPres = presionPressed.stringByReplacingOccurrencesOfString(" bares", withString: "")
            vc.presion = "p\(auxPres)"
            println("La presion pulsada: \(presionPressed)")
        }

    }
*/

    
    class Section {
        var boquis: [String] = []
        
        func addBoq(boq: String) {
            self.boquis.append(boq)
        }
    }
}
