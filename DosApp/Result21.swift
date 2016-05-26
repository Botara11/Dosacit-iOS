//
//  Result21.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 30/03/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//



import UIKit
import CoreData


class Result21: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    
    var IntervaloCaudalAdmisible0 = Double()
    var IntervaloCaudalAdmisible1 = Double()
    var IntervaloCaudalAdmisible2 = Double()
    var IntervaloCaudalAdmisible3 = Double()
    var IntervaloCaudalAdmisible4 = Double()
    var IntervaloCaudalAdmisible5 = Double()
    
    @IBOutlet var tableView: UITableView!
    
    
    var marcaPressed = String()

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

        let fetchRequest = NSFetchRequest(entityName: "FiltroBoquillas")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [FiltroBoquillas]{
            for fe in fetchResults{
                if !estaEnCadena(fe.marca) {
                    cadena.append(fe.marca)
                    self.tableData.append(fe.marca)
                }
            }
        }
        
        // Setup table data
        //for index in 0...100 {
         //   self.tableData.append("Item \(index)")
        //}
        
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.reloadData()
        //tableView.removeFromSuperview()
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier=="Result22"){
            let fetchRequest = NSFetchRequest(entityName: "B1")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [B1] {
                print("Result21 Objetos: \(fetchResults.count)")
                newItemB = fetchResults[0]
                fetchResults[0].seleccionadaMarca = marcaPressed
                do {
                    try managedObjectContext!.save()
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
            }
        }
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
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        

        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("res2")
        marcaPressed = tableData[indexPath.row]
        performSegueWithIdentifier("Result22", sender: self)
        
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


