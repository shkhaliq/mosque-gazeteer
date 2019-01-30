//
//  MosqueDataFetcher.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import FirebaseDatabase
import CodableFirebase

class MosqueDataFetcher {

    var ref: DatabaseReference

    init() {
        self.ref = Database.database().reference()
    }

    func fetch(completion: @escaping ([Mosque]?, Error?) -> Void) {
        ref.child("mosques").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value
                else {
                    completion(nil, NSError(domain: "Data does not exist", code: 404, userInfo: nil))
                    return
            }
            do {
                let mosques = try FirebaseDecoder().decode([Mosque].self, from: value)
                completion(mosques, nil)
            } catch let error {
                completion(nil, error)
            }
        })
    }
}
