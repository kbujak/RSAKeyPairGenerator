//
//  FermatVerifierTests.swift
//  WyborKluczyTests
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import XCTest
@testable import WyborKluczy

class FermatVerifierTests: XCTestCase {

    private var sut: FermatVerifier!

    override func setUp() {
        super.setUp()
        self.sut = FermatVerifier(k: 10)
    }

    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }

    func testFermatVerifier_whenCreated_notNil() {
        //then
        XCTAssertNotNil(sut)
    }
    
    func testFermatVerifier_whenVeryfingPrimeNumber_itIsTrue() {
        //when
        let result = sut.verify(number: UInt64(993319))

        //then
        XCTAssertTrue(result)
    }

    func testFermatVerifier_whenVeryfingPrimeNumber_itIsFalse() {
        //when
        let result = sut.verify(number: UInt64(993320))

        //then
        XCTAssertFalse(result)
    }

    func testNWDMethod_for282And78_is6() {
        //when
        let result = sut.getNWD(a: 282, b: 78)
        //then
        XCTAssertEqual(result, 6)
    }

    func testNWDMethod_for330And132_is66() {
        //when
        let result = sut.getNWD(a: 330, b: 132)
        //then
        XCTAssertEqual(result, 66)
    }

    func testNWDMethod_for7951And1034_is1() {
        //when
        let result = sut.getNWD(a: 7951, b: 1034)
        //then
        XCTAssertEqual(result, 1)
    }
}
