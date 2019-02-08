//
//  MosqueSalahsViewControllerTests.swift
//  mosque-gazeteerTests
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SnapshotTesting
import XCTest
@testable import mosque_gazeteer

class MosqueSalahsViewControllerTests: XCTestCase {
    func testViewController() {
        let mockDataClient = MockMosqueDataClient()
        let mockMosque = MosqueViewModel(name: "Mosque 1", id: 2)
        let viewController = MosqueSalahsViewController(mosque: mockMosque, dataClient: mockDataClient)
        assertSnapshot(matching: viewController, as: Snapshotting.hierarchy)
    }
}
