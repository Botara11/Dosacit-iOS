//
//  Result21.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 30/03/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//



import UIKit
import CoreData


class MostrarBoquillas: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    
    
    @IBOutlet var tableView: UITableView!
    
    
    var marcaPressed = String()
    
    var cadena = [String]()
    var seleccionada = 9999
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
        
        let fetchRequest = NSFetchRequest(entityName: "MisBoquillas")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [MisBoquillas]{
            for fe in fetchResults{
                cadena.append("\(fe.marcamia) (\(fe.caudalmio) L/min a \(fe.presionmia) bar)")
                self.tableData.append("\(fe.marcamia) (\(fe.caudalmio) L/min a \(fe.presionmia) bar)")
            }
        }
        
        // Setup table data
        //for index in 0...100 {
        //   self.tableData.append("Item \(index)")
        //}
        
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.reloadData()
        tableView.backgroundColor = UIColor.blackColor()
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
        cell.backgroundColor = UIColor.blackColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = self.tableData[indexPath.row]
        if (indexPath.item == seleccionada){
            var naranja = UIColor.init(red: 1, green: 0.4, blue: 0,
                alpha: 1)
            cell.backgroundColor = naranja
            cell.textLabel?.textColor = UIColor.blackColor()
        }
        return cell
    }
    
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        
        seleccionada = indexPath.item
        tableView.reloadData()
        //NO HACER NADA SI SE PRESIONA ALGUNA CELL
        /*
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
        */
    }

}


