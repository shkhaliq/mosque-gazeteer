//
//  SalahViewModelTests.swift
//  mosque-gazeteerTests
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import XCTest
@testable import mosque_gazeteer

class SalahViewModelTests: XCTestCase {

    func testSimpleViewModel() {
        let salahViewModel = SalahViewModel(id: 0, name: "Fajr", iqamah: Date.distantFuture)
        XCTAssertEqual(salahViewModel.name, "Fajr")
        XCTAssertEqual(salahViewModel.id, 0)
        XCTAssertEqual(salahViewModel.iqamah, Date.distantFuture)
    }
}
