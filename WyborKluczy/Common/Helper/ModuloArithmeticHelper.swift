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

    func modExponentiation(base: UInt64, exponent: UInt64, mod: UInt64) -> Double {
        var (a, m, n) = (Double(base), Double(exponent), Double(mod))
        var wynik: Double = 1
        var a2: Double = modulo(a: a, mod: n)

        if modulo(a: m, mod: 2) == 1 { wynik = a2 }

        m = floor(m / 2)

        repeat {
            a2 = (modulo(a: a2 * a2, mod: n))
            if modulo(a: m, mod: 2) == 1 { wynik = modulo(a: (wynik * a2), mod: n) }
            m = floor(m / 2)
        } while m != 0

        return wynik
    }
    
    private func modulo(a: Double, mod: Double) -> Double {
        let temp = floor(a / mod)
        let result = a - (temp * mod)
        return result
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
