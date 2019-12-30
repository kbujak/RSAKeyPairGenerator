//
//  PrimeNumberVerifier.swift
//  WyborKluczy
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import Foundation

protocol PrimeNumberVerifier {
    var k: Int { get }

    init(k: Int)

    func verify(number: UInt64) -> Bool
}
