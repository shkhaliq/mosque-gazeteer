//
//  Mosque.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-29.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

class Mosque: Codable {
    let name: String
    let address: String?
    let publiclyAccessible: Bool
    let salahs: [Salah]
}

class Salah: Codable {
    let iqamah: Date
    let name: String
}
