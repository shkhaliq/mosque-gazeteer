//
//  SalahViewModel.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import IGListKit

class SalahViewModel: Equatable {

    let name: String
    let time: Date

    init(name: String, time: Date) {
        self.name = name
        self.time = time
    }

    static func == (lhs: SalahViewModel, rhs: SalahViewModel) -> Bool {
        return lhs.name == rhs.name && lhs.time == rhs.time
    }
}

extension SalahViewModel {
    convenience init(_ salah: Salah) {
        self.init(name: salah.name, time: salah.iqamah)
    }
}

extension SalahViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return name as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let other = object as? SalahViewModel else { return false }
        return self == other
    }
}
