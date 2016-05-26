//
//  Result32.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 08/05/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import Foundation
import CoreData




class Result32: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var presion = String()
    var marcaPressed = String()
    let cellIdentifier = "cellIdentifier"
    var tableData = ["Teejet","Hardi","Albuz","Lechler","Discos","Otros"]
    var tableDataAux = [Int]()
    
    
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
        let fetchRequest = NSFetchRequest(entityName: "C1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [C1] {
                print("Result32 Objetos: \(fetchResults.count)")
                presion = fetchResults[0].presion
                print(fetchResults[0].presion)
            
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
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier)! as UITableViewCell
        
        cell.textLabel?.text = self.tableData[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "Result33"){
            let fetchRequest = NSFetchRequest(entityName: "C1")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [C1] {
                fetchResults[0].marca = marcaPressed
                print("presion=\(presion) marca=\(marcaPressed)")
                
                do {
                    try managedObjectContext!.save()
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
            }
        }
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("res33")
        marcaPressed = tableData[indexPath.row]
        performSegueWithIdentifier("Result33", sender: self)
        
        self.showViewController(vc as! UIViewController, sender: vc)
        
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction) in print("An alert of type \(alert.style.hashValue) was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}