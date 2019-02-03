//
//  MosqueViewModelSpec.swift
//  mosque-gazeteerTests
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import XCTest
@testable import mosque_gazeteer

class MosqueViewModelTests: XCTestCase {

    func testSimpleViewModel() {
        let mosqueViewModel = MosqueViewModel(name: "MyMosque", salahs: [])
        XCTAssert(mosqueViewModel.name == "MyMosque")
    }

    func testEmptySalahs() {
        let mosqueViewModel = MosqueViewModel(name: "MyMosque", salahs: [])
        XCTAssertTrue(mosqueViewModel.salahs.isEmpty)
    }

}
