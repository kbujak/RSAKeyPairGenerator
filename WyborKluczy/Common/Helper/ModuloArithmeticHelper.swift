//
//  ModuloArithmeticHelper.swift
//  WyborKluczy
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import Foundation

class ModuloArithmeticHelper {
    static let instance = ModuloArithmeticHelper()

    func modExponentiation(base: UInt64, exponent: UInt64, mod: UInt64) -> UInt64 {
        var (a, x, m) = (base, exponent, mod)
        var q: UInt64 = 1;
        var y: UInt64 = a;
        while (x > 0) {
            if (x % 2 == 1) { q = (q * y) % m }
            y = (y * y) % m
            x = x / 2;
        }

        return q % m
    }
    
    func getNWD(a: UInt64, b: UInt64) -> UInt64 {
        var (a, b) = (a, b)
        while true {
            let result = a / b
            let rest =  a - (result * b)
            if rest == 0 {
                return b
            }
            (a, b) = (b, rest)
        }
    }

    func getInverseNumber(a: UInt64, n: UInt64) -> UInt64? {
        let n = Int64(n)
        var inv_a: Int64
        var (gPrev, g, vPrev, v, i) = (Int64(n), Int64(a), Int64(0), Int64(1), Int64(1))

        repeat {
            let y = gPrev / g
            let gNext = gPrev - y * g
            gPrev = g
            g = gNext
            let vNext = vPrev - y * v
            vPrev = v
            v = vNext
            i += 1
        } while g != 0

        let x = vPrev
        if x >= 0 {
            inv_a = x
        } else {
            inv_a = x + n
        }

        let nwd = gPrev

        return nwd == 1 ? UInt64(inv_a) : nil
    }
}
