

import Foundation
import CoreData

class EntityBoquillas : NSManagedObject {
    
    @NSManaged var marca: String
    @NSManaged var modelo: String
    @NSManaged var diametro: Double
    @NSManaged var caudal: Double
    @NSManaged var p6:  Double
    @NSManaged var p7:  Double
    @NSManaged var p8:  Double
    @NSManaged var p9:  Double
    @NSManaged var p10: Double
    @NSManaged var p11: Double
    @NSManaged var p12: Double
    @NSManaged var p13: Double
    @NSManaged var p14: Double
    @NSManaged var p15: Double
    @NSManaged var p16: Double
    @NSManaged var activo: Int
    
}