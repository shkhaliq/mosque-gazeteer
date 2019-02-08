//
//  MosqueLabelCellTests.swift
//  mosque-gazeteerTests
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SnapshotTesting
import XCTest
@testable import mosque_gazeteer

class MosqueLabelCellTests: XCTestCase {
    func testCell() {
        let frame = CGRect(x: 0, y: 0, width: 375, height: 52)
        let cell = MosqueLabelCell(frame: frame)
        cell.backgroundColor = UIColor.lightText
        cell.bindViewModel(MosqueViewModel(name: "Mosque 1", id: 2))

        assertSnapshot(matching: cell, as: .image)
    }
}
