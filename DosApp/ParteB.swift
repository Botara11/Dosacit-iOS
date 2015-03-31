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
        newItemB.numeroTotalBoquillasAbiertas = fetchResults[0].numeroTotalBoquillas - fetchResults[0].numeroBoquillasCerradasAlta - fetchResults[0].numeroBoquillasCerradasBaja;
    newItemB.caudalLiquidoZonaAlta = fetchResults[0].caudalLiquidoTotal * Double(fetchResults[0].porcentajeVegetacionAlta / 100);
        newItemB.caudalLiquidoZonaMedia = fetchResults[0].caudalLiquidoTotal * Double(fetchResults[0].porcentajeVegetacionMedia / 100)
    newItemB.caudalLiquidoZonaBaja = fetchResults[0].caudalLiquidoTotal * Double(fetchResults[0].porcentajeVegetacionAlta / 100)
    newItemB.caudalLiquidoBoquillaAlta = (fetchResults[0].caudalLiquidoZonaAlta) / Double(fetchResults[0].numeroBoquillasAbiertasAlta)
    newItemB.caudalLiquidoBoquillaMedia = (fetchResults[0].caudalLiquidoZonaMedia) / Double(fetchResults[0].numeroBoquillasAbiertasMedia)
    newItemB.caudalLiquidoBoquillaBaja = (fetchResults[0].caudalLiquidoZonaBaja) / Double(fetchResults[0].numeroBoquillasAbiertasBaja)
    newItemB.variacionCaudalAdmisible = fetchResults[0].variacionCaudalAdmisible / 100;
    newItemB.intervaloCaudalAdmisible0 = (fetchResults[0].caudalLiquidoBoquillaAlta) * (1-(fetchResults[0].variacionCaudalAdmisible)/100);
    newItemB.intervaloCaudalAdmisible1 = (fetchResults[0].caudalLiquidoBoquillaAlta) * (1+(fetchResults[0].variacionCaudalAdmisible)/100);
    newItemB.intervaloCaudalAdmisible2 = (fetchResults[0].caudalLiquidoBoquillaMedia) * (1-(fetchResults[0].variacionCaudalAdmisible)/100);
    newItemB.intervaloCaudalAdmisible3 = (fetchResults[0].caudalLiquidoBoquillaMedia) * (1+(fetchResults[0].variacionCaudalAdmisible)/100);
    newItemB.intervaloCaudalAdmisible4 = (fetchResults[0].caudalLiquidoBoquillaBaja) * (1-(fetchResults[0].variacionCaudalAdmisible)/100);
    newItemB.intervaloCaudalAdmisible5 = (fetchResults[0].caudalLiquidoBoquillaBaja) * (1+(fetchResults[0].variacionCaudalAdmisible)/100);
    
        }
    
    }
    
    
}