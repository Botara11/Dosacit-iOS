//
//  MisBoquillas.swift
//  DosApp
//
//  Created by Alvaro Serneguet on 05/06/16.
//  Copyright © 2016 UPV. All rights reserved.
//

import Foundation
import CoreData


class MisBoquillas: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    @NSManaged var marcamia: String
    @NSManaged var caudalmio: Double
    @NSManaged var presionmia: Double

}
