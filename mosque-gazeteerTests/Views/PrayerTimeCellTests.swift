//
//  PrayerTimeCellTests.swift
//  mosque-gazeteerTests
//
//  Created by Haris Khaliq on 2019-02-03.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SnapshotTesting
import XCTest
@testable import mosque_gazeteer

class PrayerTimeCellTests: XCTestCase {
    func testCell() {
        let frame = CGRect(x: 0, y: 0, width: 375, height: 52)
        let cell = PrayerTimeCell(frame: frame)
        cell.backgroundColor = UIColor.lightText
        cell.bindViewModel(SalahViewModel(name: "Fajr", time: "6:30"))

        assertSnapshot(matching: cell, as: .image)
    }
}
