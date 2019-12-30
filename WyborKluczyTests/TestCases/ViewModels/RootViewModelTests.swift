//
//  RootViewModelTests.swift
//  WyborKluczyTests
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import XCTest
@testable import WyborKluczy

class RootViewModelTests: XCTestCase {

    private var sut: RootViewModel!

    override func setUp() {
        super.setUp()
        self.sut = RootViewModelImpl(numberGenerator: NumberGenerator(minBound: 2, maxBound: 1000),
                                     primeNumberVerifier: FermatVerifier(k: 20))
    }

    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }

    func testRootViewModel_whenCreated_notNil() {
        //then
        XCTAssertNotNil(sut)
    }
}

