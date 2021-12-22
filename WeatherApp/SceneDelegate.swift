//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private var diContainer: AppCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)

        diContainer = AppCoordinator(with: window!)
    }
}
