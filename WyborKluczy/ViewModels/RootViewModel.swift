//
//  RootViewModel.swift
//  WyborKluczy
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import Foundation

enum KeyType: String {
    case `public`, `private`
}

typealias GenerateCompletionHandler = () -> Void

protocol RootViewModel: AnyObject {
    var p: UInt64? { get }
    var q: UInt64? { get }
    var e: UInt64? { get }
    var d: UInt64? { get }
    var n: UInt64? { get }
    var handler: GenerateCompletionHandler? { get set }

    func generateKeys()
}

class RootViewModelImpl: RootViewModel {
    private(set) var p: UInt64?
    private(set) var q: UInt64?
    private(set) var e: UInt64?
    private(set) var d: UInt64?
    private(set) var n: UInt64?

    var handler: GenerateCompletionHandler?

    private let numberGenerator: NumberGenerator
    private let primeNumberVerifier: PrimeNumberVerifier
    private let facade = FileManagerFacade()

    init(numberGenerator: NumberGenerator, primeNumberVerifier: PrimeNumberVerifier) {
        self.numberGenerator = numberGenerator
        self.primeNumberVerifier = primeNumberVerifier
    }

    func generateKeys() {
        (self.p, self.q) = getPAndQ()
        self.e = getE()
        self.d = getD()
        self.n = getN()
        print((p, q, e, d, n))
        handler?()

        guard let e = self.e, let d = self.d, let n = self.n else { return }

        let publicKeyString = "{\(e), \(n)}"
        let privateKeyString = "{\(d), \(n)}"

        facade.saveFile(at: KeyType.public.rawValue, content: publicKeyString)
        facade.saveFile(at: KeyType.private.rawValue, content: privateKeyString)
    }
}

private extension RootViewModelImpl {
    func getPAndQ() -> (UInt64, UInt64) {
        var p, q: UInt64
        repeat {
            p = numberGenerator.generateRandomNumber()
        } while !primeNumberVerifier.verify(number: p)
        
        repeat {
            q = numberGenerator.generateRandomNumber()
        } while q == p || !primeNumberVerifier.verify(number: q)
        return (p, q)
    }

    func getE() -> UInt64? {
        guard let p = self.p, let q = self.q else { return nil }
        var e: UInt64
        repeat {
            e = numberGenerator.generateRandomNumber()
        } while ModuloArithmeticHelper.instance.getNWD(a: e, b: (p - 1)*(q - 1)) != 1

        return e
    }

    func getD() -> UInt64? {
        guard let p = self.p, let q = self.q, let e = self.e else { return nil }
        var d: UInt64?

        d = ModuloArithmeticHelper.instance.getInverseNumber(a: e, n: (p - 1)*(q - 1))

        return d
    }

    func getN() -> UInt64? {
        guard let p = self.p, let q = self.q else { return nil }
        return p * q
    }
}
