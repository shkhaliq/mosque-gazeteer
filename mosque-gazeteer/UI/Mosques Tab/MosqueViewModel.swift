//
//  MosqueViewModel.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

class MosqueViewModel {
    let name: String
    let id: Int

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

extension MosqueViewModel {
    convenience init(_ mosque: Mosque) {
        self.init(name: mosque.name, id: mosque.id)
    }
}


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
