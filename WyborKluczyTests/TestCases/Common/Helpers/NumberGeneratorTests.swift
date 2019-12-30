//
//  NumberGeneratorTests.swift
//  WyborKluczyTests
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import XCTest
@testable import WyborKluczy

class RandomNumberGeneratorTests: XCTestCase {

    private let minBound: UInt64 = 2
    private let maxBound: UInt64 = 1000
    private var sut: NumberGenerator!

    override func setUp() {
        super.setUp()
        self.sut = NumberGenerator(minBound: minBound, maxBound: maxBound)
    }

    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }

    func testRandomNumberGenerator_whenCreated_notNil() {
        //then
        XCTAssertNotNil(sut)
    }

    func testNumberGenerator_whenInitialisedWithMinBound_setCorrectly() {
        //then
        XCTAssertEqual(sut.minBound, minBound)
    }

    func testNumberGenerator_whenInitialisedWithMaxBound_setCorrectly() {
        //then
        XCTAssertEqual(sut.maxBound, maxBound)
    }

    func testNumberGenerator_whenGeneratingRandomNumber_notNil() {
        //when
        let randomNumber = sut.generateRandomNumber()
        
        //then
        XCTAssertNotNil(randomNumber)
    }

    func testNumberGenerator_whenGeneratingRandomNumber_equalOrGreaterThanMinBound() {
        //when
        let randomNumber = sut.generateRandomNumber()
        
        //then
        XCTAssertGreaterThanOrEqual(randomNumber, minBound)
    }
    
    func testNumberGenerator_whenGeneratingRandomNumber_equalOrLessThanMaxBound() {
        //when
        let randomNumber = sut.generateRandomNumber()
        
        //then
        XCTAssertLessThanOrEqual(randomNumber, maxBound)
    }
}
