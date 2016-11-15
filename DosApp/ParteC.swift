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
    
    func calcularParteC() {
        
        
        let fetchRequest = NSFetchRequest(entityName: "C1")
        if let fetchResults = (try? managedObjectContext!.executeFetchRequest(fetchRequest)) as? [C1] {
            
            
            fetchResults[0].caudalTotal = (Double(fetchResults[0].numBoqAbiertasAltaHidraulica) * fetchResults[0].caudalZonaAlta)+(Double(fetchResults[0].numBoqAbiertasMediaHidraulica) * fetchResults[0].caudalZonaMedia)+(Double(fetchResults[0].numBoqAbiertasBajaHidraulica) * fetchResults[0].caudalZonaBaja);
            fetchResults[0].volumenCaldoAplicado = (fetchResults[0].caudalTotal * 600/(fetchResults[0].anchoCalle * fetchResults[0].velocidadAvance));
            
            do {
                try managedObjectContext!.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
        }
        
    }
    
    
    
}




