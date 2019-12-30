//
//  FermatVerifier.swift
//  WyborKluczy
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import Foundation

class FermatVerifier: PrimeNumberVerifier {
    var k: Int

    private var verifiedRandomNumbers = [UInt64]()

    required init(k: Int) {
        self.k = k
    }

    func verify(number: UInt64) -> Bool {
        var numberOfReamainingAttempts = k
        while numberOfReamainingAttempts > 0 {
            guard !verifyComplexity(of: number) else { return false }
            numberOfReamainingAttempts -= 1
        }
        return true
    }

    private func verifyComplexity(of number: UInt64) -> Bool {
        let randomNumber = UInt64.random(in: 2..<number)
        guard !verifiedRandomNumbers.contains(randomNumber) else {
            return verifyComplexity(of: number)
        }
        verifiedRandomNumbers.append(randomNumber)
        guard !(ModuloArithmeticHelper.instance.getNWD(a: number, b: randomNumber) > 1) else { return true }
        guard ModuloArithmeticHelper.instance.modExponentiation(base: randomNumber,
                                                                exponent: number - 1,
                                                                mod: number) == 1 else { return true }
        return false
    }
}
