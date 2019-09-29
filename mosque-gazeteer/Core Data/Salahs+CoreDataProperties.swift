//
//  Salahs+CoreDataProperties.swift
//  
//
//  Created by Khaliq, Haris on 2019-09-29.
//
//

import Foundation
import CoreData


extension Salahs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Salahs> {
        return NSFetchRequest<Salahs>(entityName: "Salahs")
    }

    @NSManaged public var adhan: Date?
    @NSManaged public var begins: Date?
    @NSManaged public var iqamah: Date?
    @NSManaged public var name: String?

}
