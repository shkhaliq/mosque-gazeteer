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
        let salahViewModel = SalahViewModel(name: "Fajr", time: Date.distantFuture)
        XCTAssert(salahViewModel.name == "Fajr")
        XCTAssert(salahViewModel.time == Date.distantFuture)
    }
}
