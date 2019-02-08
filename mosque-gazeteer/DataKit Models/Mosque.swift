//
//  Mosque.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-29.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

class Mosque: Codable {
    let id: Int
    let name: String
    let publiclyAccessible: Bool?
    let updatedAt: Date

    init(id: Int, name: String, publiclyAccessible: Bool? = nil, updatedAt: Date) {
        self.id = id
        self.name = name
        self.publiclyAccessible = publiclyAccessible
        self.updatedAt = updatedAt
    }
}

class Salah: Codable {
    let begins: Date?
    let iqamah: Date
    let name: String

    init(name: String, iqamah: Date, begins: Date? = nil) {
        self.name = name
        self.iqamah = iqamah
        self.begins = begins
    }
}
