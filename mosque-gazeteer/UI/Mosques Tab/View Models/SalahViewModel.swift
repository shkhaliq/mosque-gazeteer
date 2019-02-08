//
//  SalahViewModel.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

class SalahViewModel {
    let name: String
    let time: Date

    init(name: String, time: Date) {
        self.name = name
        self.time = time
    }
}

extension SalahViewModel {
    convenience init(_ salah: Salah) {
        self.init(name: salah.name, time: salah.iqamah)
    }
}
