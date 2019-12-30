//
//  NumberGenerator.swift
//  WyborKluczy
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import Foundation

class NumberGenerator {
    private(set) var minBound: UInt64
    private(set) var maxBound: UInt64

    init(minBound: UInt64, maxBound: UInt64) {
        self.minBound = minBound
        self.maxBound = maxBound
    }

    func generateRandomNumber() -> UInt64 {
        return UInt64.random(in: minBound...maxBound)
    }
}
