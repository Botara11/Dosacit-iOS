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
    
    
    var cadena = [String]()
    
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
        
        var str = ("marca == %@ AND presion == %@") as String
        let predicate1 = NSPredicate(format: str , marca, presion)
        let fetchRequest = NSFetchRequest(entityName: "FiltroBoquillas")
        fetchRequest.predicate = predicate1
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [FiltroBoquillas]{
            for fe in fetchResults{
                    //Aqui habria que diferenciar entre zona1 zona2 y zona3
                    cadena.append(fe.modelo)
                    self.tableData.append(fe.modelo)
                
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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as! UITableViewCell
        
        cell.textLabel?.text = self.tableData[indexPath.row]
        
        return cell
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("res2")
        self.showViewController(vc as! UIViewController, sender: vc)
        
        
        
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}