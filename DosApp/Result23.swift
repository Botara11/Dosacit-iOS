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
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
            print("Result23 Objetos: \(fetchResults.count)")
            
            marca = fetchResults[0].seleccionadaMarca
            presion = fetchResults[0].seleccionadaPresion
            
            sections.append(Section())
            sections.append(Section())
            sections.append(Section())
            let str = ("marca == %@ AND presion == %@") as String
            let predicate1 = NSPredicate(format: str , marca, presion)
            let fetchRequest = NSFetchRequest(entityName: "FiltroBoquillas")
            let yearSort = NSSortDescriptor(key: "modelo", ascending: true)
            fetchRequest.predicate = predicate1
            fetchRequest.sortDescriptors = [yearSort]
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [FiltroBoquillas]{
                for fe in fetchResults{
                    //Aqui habria que diferenciar entre zona1 zona2 y zona3
                    //cadena.append(fe.modelo)
                    //self.tableData.append(fe.modelo)
                    if fe.zona == "alta" {
                        self.sections[0].addBoq(fe.modelo)
                        print("alta \(fe.modelo)")
                    }
                    if fe.zona == "media" {
                        self.sections[1].addBoq(fe.modelo)
                        print("media \(fe.modelo)")
                    }
                    if fe.zona == "baja" {
                        self.sections[2].addBoq(fe.modelo)
                        print("baja \(fe.modelo)")
                    }
                }
            }
            
            tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
            tableView.reloadData()
            tableView.backgroundColor = UIColor.blackColor()
            tableView.sectionIndexColor = UIColor.blackColor()
            //tableView.removeFromSuperview()
        }
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
        print("Seccion \(section) hay \(self.sections[section].boquis.count)")
        return self.sections[section].boquis.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier)! as UITableViewCell
        
        //cell.textLabel?.text = self.tableData[indexPath.row]
        cell.textLabel?.text = self.sections[indexPath.section].boquis[indexPath.row]
        cell.backgroundColor = UIColor.blackColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        
        // let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("res2")
        // self.showViewController(vc as! UIViewController, sender: vc)
        
        /*
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
        style: UIAlertActionStyle.Default,
        handler: {
        (alert: UIAlertAction) in print("An alert of type \(alert.style.hashValue) was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        */
    }
/*
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var view = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
        var label = UILabel(frame: CGRectMake(0,0, tableView.frame.size.width/2, 20))
        label.textColor = UIColor.blackColor()
        label.text="My Details"
        //let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        //button.frame = CGRectMake(0, 0,  tableView.frame.size.width/2, 20)
        //button.addTarget(self, action: "visibleRow", forControlEvents:.TouchUpInside)
        //
        //label.setTranslatesAutoresizingMaskIntoConstraints(false)
        //button.setTranslatesAutoresizingMaskIntoConstraints(false)
        let views = ["label": label,"view": view]
        var horizontallayoutContraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[label(20)]-60-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        view.addConstraints(horizontallayoutContraints)
        view.backgroundColor = UIColor.orangeColor()
        return view
    }
    */
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var returnedView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50)) //set these values as necessary
        
        var naranja = UIColor.init(red: 1, green: 0.4, blue: 0,
                alpha: 1)
        returnedView.backgroundColor = naranja
        
        var label = UILabel(frame: CGRectMake(10,0, tableView.frame.size.width/2, 20))
        label.text = self.tableView(tableView, titleForHeaderInSection: section)
        returnedView.addSubview(label)
        
        return returnedView
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
    if(segue.identifier == "Result32"){
    let vc = segue.destinationViewController as! Result22
    vc.marca = marca
    //var auxPres = presionPressed.stringByReplacingOccurrencesOfString(" bar", withString: "")
    // vc.presion = "p\(auxPres)"
    // println("La presion pulsada: \(presionPressed)")
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
