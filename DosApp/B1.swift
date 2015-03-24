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
    @NSManaged var caudalLiquidoBoquillaAlta: Int
    @NSManaged var caudalLiquidoBoquillaBaja: Int
    @NSManaged var caudalLiquidoBoquillaMedia: Int
    @NSManaged var caudalLiquidoSector: Double
    @NSManaged var caudalLiquidoTotal: Double
    @NSManaged var caudalLiquidoZonaAlta: Int
    @NSManaged var caudalLiquidoZonaBaja: Int
    @NSManaged var caudalLiquidoZonaMedia: Int
    @NSManaged var intervaloCaudalAdmisible0: Int
    @NSManaged var intervaloCaudalAdmisible1: Int
    @NSManaged var intervaloCaudalAdmisible2: Int
    @NSManaged var intervaloCaudalAdmisible3: Int
    @NSManaged var intervaloCaudalAdmisible4: Int
    @NSManaged var intervaloCaudalAdmisible5: Int
    @NSManaged var numeroBoquillasAbiertasAlta: Int
    @NSManaged var numeroBoquillasAbiertasBaja: Int
    @NSManaged var numeroBoquillasAbiertasMedia: Int
    @NSManaged var numeroBoquillasCerradasAlta: Int
    @NSManaged var numeroBoquillasCerradasBaja: Int
    @NSManaged var numeroBoquillasSector: Int
    @NSManaged var numeroTotalBoquillas: Int
    @NSManaged var numeroTotalBoquillasAbiertas: Int
    @NSManaged var porcentajeVegetacionAlta: Int
    @NSManaged var porcentajeVegetacionBaja: Int
    @NSManaged var porcentajeVegetacionMedia: Int
    @NSManaged var variacionCaudalAdmisible: Double
    @NSManaged var velocidadAvance: Double
    @NSManaged var volumenApp: Double
    
    
    
    
}