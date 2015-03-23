//
//  B1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 16/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class B1: NSManagedObject {
    
    @NSManaged var anchoCalle: Double
    @NSManaged var caudalLiquidoBoquilla: [Int]
    @NSManaged var caudalLiquidoSector: Double
    @NSManaged var caudalLiquidoTotal: Double
    @NSManaged var caudalLiquidoZona: [Int]
    @NSManaged var intervaloCaudalAdmisible: [Int]
    @NSManaged var numeroBoquillasAbiertas: [Int]
    @NSManaged var numeroBoquillasCerradas: [Int]
    @NSManaged var numeroBoquillasSector: Int
    @NSManaged var numeroTotalBoquillas: Int
    @NSManaged var numeroTotalBoquillasAbiertas: Int
    @NSManaged var porcentajeVegetacion: [Int]
    @NSManaged var variacionCaudalAdmisible: Double
    @NSManaged var velocidadAvance: Double
    @NSManaged var volumenApp: Double
    
    
    
    
}