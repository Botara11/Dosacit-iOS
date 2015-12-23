//
//  ID.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 8/11/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import Foundation
import UIKit
import CoreData




let managedObjectContextZ = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext


let newItemZ = NSEntityDescription.insertNewObjectForEntityForName("Z1", inManagedObjectContext: managedObjectContext!) as! Z1




class ID: UIViewController {
    
   
    @IBOutlet var fechaText: UITextField!
    @IBOutlet var idParcelaText: UITextField!
    @IBOutlet var idTratamientoText: UITextField!
    @IBOutlet var referenciaText: UITextField!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        
            
            newItemZ.fecha = fechaText.text! as String
            newItemZ.idParcela = idParcelaText.text! as String
            newItemZ.idTratamiento = idTratamientoText.text! as String
            newItemZ.referencia = referenciaText.text! as String
            print(idTratamientoText.text)

        
        
    }
    
    override func viewDidLoad() {
        
        newItemZ.fecha = " Sin fecha"
        newItemZ.idParcela = "Sin identificar"
        newItemZ.idTratamiento = "Sin identificar"
        newItemZ.referencia = "Sin referencia"
    
    }
    
}