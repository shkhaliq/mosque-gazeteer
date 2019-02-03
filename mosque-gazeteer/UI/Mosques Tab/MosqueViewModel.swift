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

    init(name: String) {
        self.name = name
    }
}

extension MosqueViewModel {
    convenience init(_ mosque: Mosque) {
        self.init(name: mosque.name)
    }
}
