//
//  MockMosqueDataClient.swift
//  mosque-gazeteerTests
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
@testable import mosque_gazeteer

class MockMosqueDataClient: MosqueDataClientType {

    func fetchAllMosques(completionHandler: @escaping ([Mosque]?, Error?) -> Void) {
        completionHandler([
            Mosque(id: 1, name: "Mosque 1", updatedAt: Date.distantFuture),
            Mosque(id: 2, name: "Mosque 2", updatedAt: Date.distantFuture),
            Mosque(id: 3, name: "Mosque 3", updatedAt: Date.distantFuture),
            ], nil)
    }

    func fetchAllSalahs(for id: Int, completionHandler: @escaping ([Salah]?, Error?) -> Void) {
        completionHandler([
            Salah(name: "Fajr", iqamah: Date.distantFuture),
            Salah(name: "Zuhr", iqamah: Date.distantFuture),
            Salah(name: "Magrib", iqamah: Date.distantFuture),
            Salah(name: "Isha", iqamah: Date.distantFuture),
            Salah(name: "Jummah 1", iqamah: Date.distantFuture),
            Salah(name: "Jummah 2", iqamah: Date.distantFuture),
            ], nil)
    }
}
