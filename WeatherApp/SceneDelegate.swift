//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private var diContainer: DIContainer!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        
        diContainer = DIContainer()
        let navigationController = UINavigationController()
        let coordinator = MainCoordinator(with: navigationController, and: diContainer)
        diContainer.mainCoordinator = coordinator
        coordinator.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

protocol Coordinator {
    func start()
    func searchScreenOpen()
}

