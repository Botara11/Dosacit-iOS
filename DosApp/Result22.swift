//
//  Result22.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 13/04/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import UIKit
import Foundation
import CoreData




class Result22: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var presionPressed = String()
    var marca = String()
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
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
        
        marca = newItemB.seleccionadaMarca
        println(marca)
        println("VALEEEEEEEEEEEEEEE")
        
        var str = ("marca == %@") as String
        let predicate1 = NSPredicate(format: str , marca)
        let fetchRequest = NSFetchRequest(entityName: "FiltroBoquillas")
        fetchRequest.predicate = predicate1
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [FiltroBoquillas]{
            for fe in fetchResults{
                if !estaEnCadena(fe.presion) {
                    cadena.append(fe.presion)
                    var sss = fe.presion.stringByReplacingOccurrencesOfString("p", withString: "")
                    //self.tableData.append("\(sss) bares")
                    self.tableDataAux.append((sss as NSString).integerValue)
                }
            }
        }
        
        tableDataAux.sort({$0<$1})
        for uu in tableDataAux{
            self.tableData.append("\(uu) bares")
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "Result23"){
            let vc = segue.destinationViewController as! Result23
            //vc.marca = marca

            var auxPres = presionPressed.stringByReplacingOccurrencesOfString(" bares", withString: "")
            //vc.presion = "p\(auxPres)"
            newItemB.seleccionadaPresion = "p\(auxPres)"
            println("La presion pulsada: \(presionPressed)")
        }
    }
    
    
    
    // UITableViewDelegate methods
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        
        let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("res3")
        presionPressed = tableData[indexPath.row]
        performSegueWithIdentifier("Result23", sender: self)
        
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