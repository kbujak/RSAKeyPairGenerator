//
//  SceneDelegate.swift
//  WyborKluczy
//
//  Created by Krystian Bujak on 29/12/2019.
//  Copyright © 2019 Booyac IT. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        let VM = RootViewModelImpl(numberGenerator: NumberGenerator(minBound: 2, maxBound: 1000000000),
                               primeNumberVerifier: FermatVerifier(k: 20))
        let VC = RootViewController(viewModel: VM)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = VC
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

