//
//  FiltroBoquillas.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 12/04/15.
//  Copyright (c) 2015 UPV. All rights reserved.
//

import Foundation
import CoreData

class FiltroBoquillas: NSManagedObject {

    @NSManaged var marca: String
    @NSManaged var modelo: String
    @NSManaged var presion: String
    @NSManaged var zona : String

}
