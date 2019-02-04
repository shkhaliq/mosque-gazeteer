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
    let salahs: [SalahViewModel]

    init(name: String, salahs: [SalahViewModel]) {
        self.name = name
        self.salahs = salahs
    }
}

extension MosqueViewModel {
    convenience init(_ mosque: Mosque) {
        let salahs = mosque.salahs.map({ SalahViewModel(name: $0.name, time: $0.iqamah)})
        self.init(name: mosque.name, salahs: salahs)
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
