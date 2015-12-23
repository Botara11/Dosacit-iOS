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
    var tableData = ["6 bares","7 bares","8 bares","9 bares","10 bares","11 bares","12 bares","13 bares","14 bares","15 bares","16 bares"]
    
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

        let hola = updateBoquillas()
        
        hola.updateBoquillas()
        
        /*
        let fetchRequest = NSFetchRequest(entityName: "FiltroBoquillas")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [FiltroBoquillas]{
            for fe in fetchResults{
                if !estaEnCadena(fe.marca) {
                    cadena.append(fe.marca)
                    self.tableData.append(fe.marca)
                }
            }
        }
        */
        // Setup table data
        //for index in 0...100 {
        //   self.tableData.append("Item \(index)")
        //}
        
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.reloadData()
        //tableView.removeFromSuperview()
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier=="Result32"){
            let vc = segue.destinationViewController as! Result32
            //vc.presion = presionPressed
            newItemC.presion = presionPressed
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("res32")
        presionPressed = "p" + tableData[indexPath.row].stringByReplacingOccurrencesOfString(" bares", withString: "")
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


