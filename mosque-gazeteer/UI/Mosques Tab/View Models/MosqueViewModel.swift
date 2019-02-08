//
//  MosqueViewModel.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import IGListKit

class MosqueViewModel: Equatable {

    let name: String
    let id: Int

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }

    static func == (lhs: MosqueViewModel, rhs: MosqueViewModel) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

extension MosqueViewModel {
    convenience init(_ mosque: Mosque) {
        self.init(name: mosque.name, id: mosque.id)
    }
}

extension MosqueViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObject
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let other = object as? MosqueViewModel else { return false }
        return self == other
    }
}
