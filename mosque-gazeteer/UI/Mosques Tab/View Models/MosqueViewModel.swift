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
    let address: String
    let id: Int

    init(id: Int, name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }

    static func == (lhs: MosqueViewModel, rhs: MosqueViewModel) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.address == rhs.address
    }
}

extension MosqueViewModel {
    convenience init(_ mosque: Mosque) {
        self.init(id: mosque.id, name: mosque.name, address: "")
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

extension MosqueViewModel: Identifiable {}
