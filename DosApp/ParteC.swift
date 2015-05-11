//
//  ParteC.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 9/5/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import Foundation
import Darwin
import CoreData
import UIKit


public class ParteC {
    
    /**** B ****/
  
    
   
        
    }
    
    
    func calcularParteC() {
        
        
        let fetchRequest = NSFetchRequest(entityName: "C1")
        if let fetchResults = managedObjectContextC!.executeFetchRequest(fetchRequest, error: nil) as? [C1] {
            
            
            
            newItemC.volumenCaldoAplicado = (fetchResults[0].caudalTotal * 600/(fetchResults[0].anchoCalle * fetchResults[0].velocidadAvance));
            
            
            
        }
        
    }
    
    
