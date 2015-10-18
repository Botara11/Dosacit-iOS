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
    @NSManaged var anchoCalleNuevo: Double
    @NSManaged var anchoCalleViejo: Double
    @NSManaged var caudalLiquidoBoquillaAlta: Double
    @NSManaged var caudalLiquidoBoquillaBaja: Double
    @NSManaged var caudalLiquidoBoquillaMedia: Double
    @NSManaged var caudalLiquidoSector: Double
    @NSManaged var caudalLiquidoTotal: Double
    @NSManaged var caudalLiquidoZonaAlta: Double
    @NSManaged var caudalLiquidoZonaBaja: Double
    @NSManaged var caudalLiquidoZonaMedia: Double
    @NSManaged var flagVolumen: Int
    @NSManaged var flagAncho: Int
    @NSManaged var intervaloCaudalAdmisible0: Double
    @NSManaged var intervaloCaudalAdmisible1: Double
    @NSManaged var intervaloCaudalAdmisible2: Double
    @NSManaged var intervaloCaudalAdmisible3: Double
    @NSManaged var intervaloCaudalAdmisible4: Double
    @NSManaged var intervaloCaudalAdmisible5: Double
    @NSManaged var numeroBoquillasAbiertasAlta: Int
    @NSManaged var numeroBoquillasAbiertasBaja: Int
    @NSManaged var numeroBoquillasAbiertasMedia: Int
    @NSManaged var numeroBoquillasCerradasAlta: Int
    @NSManaged var numeroBoquillasCerradasBaja: Int
    @NSManaged var numeroBoquillasSector: Int
    @NSManaged var numeroTotalBoquillas: Int
    @NSManaged var numeroTotalBoquillasAbiertas: Int
    @NSManaged var parteAoB: Int
    @NSManaged var porcentajeVegetacionAlta: Int
    @NSManaged var porcentajeVegetacionBaja: Int
    @NSManaged var porcentajeVegetacionMedia: Int
    @NSManaged var variacionCaudalAdmisible: Double
    @NSManaged var velocidadAvance: Double
    @NSManaged var volumenApp: Double
    @NSManaged var volumenAppNuevo: Double
    @NSManaged var volumenAppViejo: Double
    @NSManaged var seleccionadaPresion: String
    @NSManaged var seleccionadaMarca: String
      
}