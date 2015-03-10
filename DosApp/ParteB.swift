//
//  ParteB.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 24/2/15.
//  Copyright (c) 2015 Borja Tarazona Raga. All rights reserved.
//

import Foundation


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
    
    
    func calcularParteB() {
    
    caudalLiquidoTotal = volumenApp*anchoTrabajo*velocidadAvance / 600;  //600 HARCODEADO---------
    caudalLiquidoSector = caudalLiquidoTotal / 2; // SectorIzquierdo y Sector Derecho
    numeroBoquillasSector = numeroTotalBoquillas/2;
    numeroTotalBoquillasAbiertas = numeroTotalBoquillas - numeroBoquillasCerradas[0] - numeroBoquillasCerradas[1];
    caudalLiquidoZona[0] = caudalLiquidoTotal * Double(porcentajeVegetacion[0]) / 100;
    caudalLiquidoZona[1] = caudalLiquidoTotal * Double(porcentajeVegetacion[1]) / 100;
    caudalLiquidoZona[2] = caudalLiquidoTotal * Double(porcentajeVegetacion[2]) / 100;
    caudalLiquidoBoquilla[0] = caudalLiquidoZona[0] / Double(numeroBoquillasAbiertas[0]);
    caudalLiquidoBoquilla[1] = caudalLiquidoZona[1] / Double(numeroBoquillasAbiertas[1]);
    caudalLiquidoBoquilla[2] = caudalLiquidoZona[2] / Double(numeroBoquillasAbiertas[2]);
    variacionCaudalAdmisible = variacionCaudalAdmisible / 100;
    intervaloCaudalAdmisible[0] = caudalLiquidoBoquilla[0] * (1-variacionCaudalAdmisible);
    intervaloCaudalAdmisible[1] = caudalLiquidoBoquilla[0] * (1+variacionCaudalAdmisible);
    intervaloCaudalAdmisible[2] = caudalLiquidoBoquilla[1] * (1-variacionCaudalAdmisible);
    intervaloCaudalAdmisible[3] = caudalLiquidoBoquilla[1] * (1+variacionCaudalAdmisible);
    intervaloCaudalAdmisible[4] = caudalLiquidoBoquilla[2] * (1-variacionCaudalAdmisible);
    intervaloCaudalAdmisible[5] = caudalLiquidoBoquilla[2] * (1+variacionCaudalAdmisible);
    
    
    
    }
    
    
}