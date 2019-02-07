//
//  MosquesListDataSource.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

class MosquesListDataSource {

    var items: [MosqueViewModel] = []

    public func load(_ completion: @escaping (() -> Void)) {
        MosqueDataClient.shared.fetchAllMosques { (mosques, _) in
            guard let mosques = mosques else {
                completion()
                return
            }
            self.items = mosques.map(MosqueViewModel.init)
            completion()
        }
    }


}
