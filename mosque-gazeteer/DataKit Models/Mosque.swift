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
}

class Salah: Codable {
    let iqamah: Date
    let name: String
}
