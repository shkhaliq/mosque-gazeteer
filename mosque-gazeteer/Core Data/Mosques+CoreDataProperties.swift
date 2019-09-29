//
//  Mosques+CoreDataProperties.swift
//  
//
//  Created by Khaliq, Haris on 2019-09-29.
//
//

import Foundation
import CoreData


extension Mosques {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mosques> {
        return NSFetchRequest<Mosques>(entityName: "Mosques")
    }

    @NSManaged public var address: String
    @NSManaged public var phoneNumber: Int64?
    @NSManaged public var webUrl: URL?
    @NSManaged public var name: String

}
