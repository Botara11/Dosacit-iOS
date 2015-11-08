//
//  Z1.swift
//  DosApp
//
//  Created by Borja Tarazona Raga on 8/11/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class Z1: NSManagedObject {
    
    @NSManaged var fecha: String
    @NSManaged var idTratamiento: String
    @NSManaged var idParcela: String
    @NSManaged var referencia: String
  
}