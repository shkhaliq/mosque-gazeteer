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
