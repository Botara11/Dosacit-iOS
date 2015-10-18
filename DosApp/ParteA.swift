//
//  CaractCultivo.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 4/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation
import Darwin
import CoreData
import UIKit



class ParteA {

    var IndiceDosificacion =  0.085;
    var litroHanegada = 1;
    var VolumenArbol = 1.0
    let pi = M_PI;
    var esfericoSeto = 1.0;
    
    
    // A1
    
    var densidadFoliar = 1.15;
    var anchoCalle = 1.0;
    var distanciaArboles = 1.0;
    var longitudArboles = 1.0;
    var anchuraArboles = 1.0;
    var alturaArboles = 1.0;
    var alturaMeseta = 1.0;
    var formaArbol = 1.0;
    var fechaUltimaPoda = 0.95;
    var gradoPoda = 0.95;
    
    // A2
    
    var productosAplicar = 1.05;
    var formaActuacion = 1.05;
    var mojantes = 1.0;
    var zonaCriticaTratar = 3.0;
    
    // A3
    
    var temperatura = 1.0;
    var humedad = 1.05;
    var velocidadViento = 1.0;
    
    // A4
    
    var tipoPulverizador = 1.0;
    
    
    func volumenDeAplicacion () ->Int{
        
        var  NumeroArbolesPorHect = 1.0, VolumenSetoAsigArbol = 1.0, TRV = 1.0;
        var litroHectarea = 0;

        
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
        
        if (fetchResults[0].esfericoSeto == 0){
        VolumenArbol = pi * fetchResults[0].longitudArboles * fetchResults[0].anchuraArboles * fetchResults[0].alturaArboles / 6;
        } else if (fetchResults[0].esfericoSeto == 1){
            VolumenArbol = fetchResults[0].longitudArboles * fetchResults[0].anchuraArboles * fetchResults[0].alturaArboles;
        }
        
        NumeroArbolesPorHect = 10000 / (fetchResults[0].anchoCalle * fetchResults[0].distanciaArboles);
        VolumenSetoAsigArbol = fetchResults[0].volumenArbol * fetchResults[0].distanciaArboles
        / fetchResults[0].longitudArboles;
        TRV = NumeroArbolesPorHect * VolumenSetoAsigArbol;
        
        println("\(TRV) TRV")
            
        var FactorA1 = 0.0, FactorA2 = 0.0, FactorA3 = 0.0, FactorA4 = 0.0, FactorEficiencia = 0.0;
        
        FactorA1 = fetchResults[0].densidadFoliar * fetchResults[0].formaArbol * fetchResults[0].fechaUltimaPoda * fetchResults[0].gradoPoda;
        println("\(FactorA1) FactorA1")
            println("\(fetchResults[0].densidadFoliar) fetchResults[0].densidad")
            println("\(fetchResults[0].formaArbol) fetchResults[0].forma")
            println("\(fetchResults[0].fechaUltimaPoda) fetchResults[0].fecha")
            println("\(fetchResults[0].gradoPoda) fetchResults[0].grado")
        
        FactorA2 = fetchResults[0].productosAplicar * fetchResults[0].formaActuacion * fetchResults[0].mojantes
        * fetchResults[0].zonaCritica;
            println("\(fetchResults[0].productosAplicar) fetchResults[0].productosAplicar")
            println("\(fetchResults[0].formaActuacion) fetchResults[0].ACTUACION")
            println("\(fetchResults[0].mojantes) fetchResults[0].mojantes")
            println("\(fetchResults[0].zonaCritica) fetchResults[0].zonacritica")
        FactorA3 = fetchResults[0].temperatura * fetchResults[0].humedadRelativa * fetchResults[0].velocidadViento;
            println("\(FactorA3) FactorA3")
        FactorA4 = fetchResults[0].tipoPulverizador;
            println("\(FactorA4) FactorA4")
        
        FactorEficiencia = FactorA1 * FactorA2 * FactorA3 * FactorA4;
        
        // VOLUMEN DE APLICACION
        var temp = TRV * IndiceDosificacion * FactorEficiencia;
        println("\(temp) temp")
        
        if (temp % 100 > 50){
            var a = (( (temp) / 100));
            var IntTemp:Int = Int(a)
            litroHectarea = (IntTemp + 1) * 100;
        }
        else{
            var b = ( (temp / 100));
            var IntTempB:Int = Int(b);
            litroHectarea = IntTempB * 100;
            
        }
        
        }
        newItem.volumenAplicacionLHA = litroHectarea
        newItemB.volumenApp = Double(litroHectarea)
        newItemB.volumenAppViejo = Double(litroHectarea)
        newItem.volumenAplicacionLHG = litroHectarea/12
        
        //litroHanegada = litroHectarea/12;

        return litroHectarea;

    }
    
    func calcularVolumenArbol () ->Double{
        
        let fetchRequest = NSFetchRequest(entityName: "A1")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [A1] {
        
        if (fetchResults[0].esfericoSeto == 0){
            VolumenArbol = pi * fetchResults[0].longitudArboles * fetchResults[0].anchuraArboles * fetchResults[0].alturaArboles / 6;
        } else if (fetchResults[0].esfericoSeto == 1){
            VolumenArbol = fetchResults[0].longitudArboles * fetchResults[0].anchuraArboles * fetchResults[0].alturaArboles;
        }
            
        }
        
        
        
            newItem.volumenArbol = VolumenArbol
        
        
        return VolumenArbol;
        
    }
}