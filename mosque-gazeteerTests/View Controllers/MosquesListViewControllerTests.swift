//
//  MosquesListViewControllerTests.swift
//  mosque-gazeteerTests
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SnapshotTesting
import XCTest
@testable import mosque_gazeteer

class MosquesListViewControllerTests: XCTestCase {
    func testViewController() {
        let mockDataClient = MockMosqueDataClient()
        let viewController = MosquesListViewController(dataClient: mockDataClient)
        assertSnapshot(matching: viewController, as: .image)
    }
}
