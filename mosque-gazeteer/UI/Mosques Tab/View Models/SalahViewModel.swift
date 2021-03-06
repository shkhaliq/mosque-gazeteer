//
//  SalahViewModel.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

struct SalahViewModel: Identifiable {
    let id: Int
    let name: String
    let iqamah: Date
}

extension SalahViewModel {
    init?(_ salah: Salah) {
        guard let name = salah.name, let iqamah = salah.iqamah else { return nil }
        
        self.name = name
        self.iqamah = iqamah
        self.id = Int(salah.id)
    }
}


extension Array where Element: Salah {
    func sortedByIqamah() -> [Salah] {
        return sorted(by: { salah, salah2 -> Bool in
            if let iqamah = salah.iqamah, let iqamah2 = salah2.iqamah {
                return iqamah.compare(iqamah2) == .orderedAscending
            }
            return false
        })
    }
}
