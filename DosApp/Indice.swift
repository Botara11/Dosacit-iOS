//
//  Indice.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 26/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import UIKit
import CoreData


let managedObjectContextZ3 = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext


let newItemZ3 = NSEntityDescription.insertNewObjectForEntityForName("Z1", inManagedObjectContext: managedObjectContext!) as! Z1

class Indice: UIViewController {
    
    
    //@IBOutlet var scroller: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newItemZ.fecha = " Sin fecha"
        newItemZ.idParcela = "Sin identificar"
        newItemZ.idTratamiento = "Sin identificar"
        newItemZ.referencia = "Sin referencia"
        //scroller.userInteractionEnabled = true
        //scroller.contentSize = CGSizeMake(375, 588)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//let secondViewController = self.storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as SecondViewController

//self.navigationController.pushViewController(secondViewController, animated: true)