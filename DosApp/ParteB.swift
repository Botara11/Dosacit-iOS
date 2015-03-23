//
//  ParteB.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 24/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import Darwin
import CoreData
import UIKit


public class ParteB {
    
    /**** B ****/
    var volumenApp = 0.0;
    var anchoTrabajo = 0.0;
    var velocidadAvance = 0.0;
    var caudalLiquidoTotal = 0.0;
    var caudalLiquidoSector = 0.0;
    var numeroTotalBoquillas = 0;
    var numeroBoquillasCerradas = [Int](); // Z.Alta y Z.Baja
    var numeroBoquillasAbiertas = [Int](); // Z.Alta Z.Media y Z.Baja
    var porcentajeVegetacion = [Int](); // Z.Alta Z.Media y Z.Baja
    var intervaloCaudalAdmisible = [Double](); // Z.Alta Z.Media y Z.Baja
    var variacionCaudalAdmisible = 0.0;
    var alturaMeseta = 0.0; //PARTE A
    var numeroBoquillasSector = 0;
    var numeroTotalBoquillasAbiertas = 0;
    var caudalLiquidoZona = [Double]();
    var caudalLiquidoBoquilla = [Double]();
    
    func calcularCaudalesB(){
        
        let fetchRequest = NSFetchRequest(entityName: "B1")
        if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
            
        newItemB.caudalLiquidoTotal = fetchResults[0].volumenApp * fetchResults[0].anchoCalle * fetchResults[0].velocidadAvance / 600;
        newItemB.caudalLiquidoSector = fetchResults[0].caudalLiquidoTotal / 2; // SectorIzquierdo y Sector Derecho
            
        }

    }
    
    
    func calcularParteB() {
        
        
    let fetchRequest = NSFetchRequest(entityName: "B1")
    if let fetchResults = managedObjectContextB!.executeFetchRequest(fetchRequest, error: nil) as? [B1] {
                

    
    newItemB.caudalLiquidoTotal = fetchResults[0].volumenApp * fetchResults[0].anchoCalle * fetchResults[0].velocidadAvance / 600;
        
        //600 HARCODEADO---------
    newItemB.caudalLiquidoSector = fetchResults[0].caudalLiquidoTotal / 2; // SectorIzquierdo y Sector Derecho
    newItemB.numeroBoquillasSector = fetchResults[0].numeroTotalBoquillas/2;
    newItemB.numeroTotalBoquillasAbiertas = fetchResults[0].numeroTotalBoquillas - fetchResults[0].numeroBoquillasCerradas[0] - fetchResults[1].numeroBoquillasCerradas[1];
    newItemB.caudalLiquidoZona[0] = Int(fetchResults[0].caudalLiquidoTotal) * fetchResults[0].porcentajeVegetacion[0] / 100;
    newItemB.caudalLiquidoZona[1] = Int(fetchResults[0].caudalLiquidoTotal) * fetchResults[0].porcentajeVegetacion[1] / 100;
    newItemB.caudalLiquidoZona[2] = Int(fetchResults[0].caudalLiquidoTotal) * fetchResults[0].porcentajeVegetacion[2] / 100;
    newItemB.caudalLiquidoBoquilla[0] = Int(fetchResults[0].caudalLiquidoZona[0]) / fetchResults[0].numeroBoquillasAbiertas[0];
    newItemB.caudalLiquidoBoquilla[1] = Int(fetchResults[0].caudalLiquidoZona[1]) / fetchResults[0].numeroBoquillasAbiertas[1];
    newItemB.caudalLiquidoBoquilla[2] = Int(fetchResults[0].caudalLiquidoZona[2]) / fetchResults[0].numeroBoquillasAbiertas[2];
    newItemB.variacionCaudalAdmisible = fetchResults[0].variacionCaudalAdmisible / 100;
    newItemB.intervaloCaudalAdmisible[0] = Int(fetchResults[0].caudalLiquidoBoquilla[0]) * (1-Int(fetchResults[0].variacionCaudalAdmisible));
    newItemB.intervaloCaudalAdmisible[1] = Int(fetchResults[0].caudalLiquidoBoquilla[0]) * (1+Int(fetchResults[0].variacionCaudalAdmisible));
    newItemB.intervaloCaudalAdmisible[2] = Int(fetchResults[0].caudalLiquidoBoquilla[1]) * (1-Int(fetchResults[0].variacionCaudalAdmisible));
    newItemB.intervaloCaudalAdmisible[3] = Int(fetchResults[0].caudalLiquidoBoquilla[1]) * (1+Int(fetchResults[0].variacionCaudalAdmisible));
    newItemB.intervaloCaudalAdmisible[4] = Int(fetchResults[0].caudalLiquidoBoquilla[2]) * (1-Int(fetchResults[0].variacionCaudalAdmisible));
    newItemB.intervaloCaudalAdmisible[5] = Int(fetchResults[0].caudalLiquidoBoquilla[2]) * (1+Int(fetchResults[0].variacionCaudalAdmisible));
    
        }
    
    }
    
    
}