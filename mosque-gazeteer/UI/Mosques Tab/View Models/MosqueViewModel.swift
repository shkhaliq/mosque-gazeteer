//
//  MosqueViewModel.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

struct MosqueViewModel: Identifiable {
    
    let name: String
    let address: String
    let id: Int
    let salahs: [SalahViewModel]
}

extension MosqueViewModel {
    init?(_ mosque: Mosque) {
        guard let name = mosque.name,
            let address = mosque.address
            else {
                return nil
        }
        self.name = name
        self.address = address
        self.id = Int(mosque.id)
        self.salahs = mosque.salahs?
            .compactMap({ $0 as? Salah })
            .compactMap({ SalahViewModel($0) }) ?? []
    }
}
