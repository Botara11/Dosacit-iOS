//
//  Result31.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 08/05/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//



import UIKit
import CoreData


class Result31: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
   
    let cellIdentifier = "cellIdentifier"
    var tableData = ["6 bar","7 bar","8 bar","9 bar","10 bar","11 bar","12 bar","13 bar","14 bar","15 bar","16 bar"]
    
    @IBOutlet var tableView: UITableView!
    
    
    var presionPressed = String()
    
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
            print("Result31 Objetos: \(fetchResults.count)")
            
        }
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.reloadData()
        tableView.backgroundColor = UIColor.blackColor()
        //tableView.removeFromSuperview()
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier=="Result32"){
            
            let fetchRequest = NSFetchRequest(entityName: "C1")
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [C1] {
                fetchResults[0].presion = presionPressed
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
        cell.backgroundColor = UIColor.blackColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        return cell
    }
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("res32")
        presionPressed = "p" + tableData[indexPath.row].stringByReplacingOccurrencesOfString(" bar", withString: "")
        performSegueWithIdentifier("Result32", sender: self)
        
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


