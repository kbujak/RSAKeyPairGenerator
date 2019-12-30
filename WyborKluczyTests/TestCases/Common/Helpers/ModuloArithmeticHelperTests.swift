//
//  ModuloArithmeticHelper.swift
//  WyborKluczyTests
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import XCTest
@testable import WyborKluczy

class ModuloArithmeticHelperTests: XCTestCase {

    private var sut: ModuloArithmeticHelper!

    override func setUp() {
        super.setUp()
        self.sut = ModuloArithmeticHelper()
    }

    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }

    func testModuloArithmeticHelper_whenCreated_notNil() {
        //then
        XCTAssertNotNil(sut)
    }

    func testModMethod_for13() {
        //when
        let result = sut.modExponentiation(base: 13, exponent: 11, mod: 7)
        //then
        XCTAssertEqual(result, 6)
    }
}
