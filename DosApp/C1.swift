//
//  C1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 31/3/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class C1: NSManagedObject {
    
    @NSManaged var anchoCalle: Double
    @NSManaged var caudalTotal: Double
    @NSManaged var marcaBoquilla: Int
    @NSManaged var numBoqAbiertasAltaHidraulica: Int
    @NSManaged var numBoqAbiertasBajaHidraulica: Int
    @NSManaged var numBoqAbiertasMediaHidraulica: Int
    @NSManaged var parteAoC: Int
    @NSManaged var presionTrabajo: Int
    @NSManaged var velocidadAvance: Double
    @NSManaged var volumenCaldoAplicado: Double

}