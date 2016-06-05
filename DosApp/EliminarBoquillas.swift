//
//  EliminarBoquillas.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 06/06/16.
//  Copyright © 2016 UPV. All rights reserved.
//

//
//  Result21.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 30/03/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//



import UIKit
import CoreData


class EliminarBoquillas: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    var lista = [String]()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var borrar: UIButton!
    
    
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
    
    @IBAction func borrarBoquilla(sender: AnyObject) {
        print("BORRAR")
        if(seleccionada == 9999){
            print("No hago nada ninguna seleccionada")
        }else{
            let fetchRequest = NSFetchRequest()
            fetchRequest.fetchBatchSize = 100
            fetchRequest.entity = NSEntityDescription.entityForName("MisBoquillas", inManagedObjectContext: managedObjectContext!)
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [MisBoquillas]{
                if let managedObjects = fetchResults as? [MisBoquillas] {
                    for object in managedObjects {
                        print("Misboquillas: \(object.marcamia)==\(lista[seleccionada])")
                        
                        if(object.marcamia == lista[seleccionada]){
                            print("Misboquillas borra")
                            managedObjectContext!.deleteObject(object)
                            cadena.removeAtIndex(seleccionada)
                            self.tableData.removeAtIndex(seleccionada)
                            self.tableView.reloadData()
                        }
                    }
                }
            }
            
            let str = ("marca == %@") as String
            let predicate1 = NSPredicate(format: str , "Mis boquillas")
            let fetchRequest2 = NSFetchRequest(entityName: "EntityBoquillas")
            fetchRequest2.predicate = predicate1
            if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest2)) as? [EntityBoquillas]{
                for fe in fetchResults{
                    print("Entity: \(fe.modelo)==\(lista[seleccionada])")
                    
                    if(fe.modelo == lista[seleccionada]){
                        print("Entity borra")
                        managedObjectContext!.deleteObject(fe)
                    }
                    
                }
            }

            
            
            do {
                try managedObjectContext!.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "MisBoquillas")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [MisBoquillas]{
            for fe in fetchResults{
                cadena.append("\(fe.marcamia) (\(fe.caudalmio) L/min a \(fe.presionmia) bar)")
                self.tableData.append("\(fe.marcamia) (\(fe.caudalmio) L/min a \(fe.presionmia) bar)")
                lista.append("\(fe.marcamia)")
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
        print("selecc \(seleccionada)")
        tableView.reloadData()

    }
    
}


