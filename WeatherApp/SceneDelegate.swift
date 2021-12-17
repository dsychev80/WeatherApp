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
        diContainer.mainRouter.start()
        
        window?.rootViewController = diContainer.navigationController
        window?.makeKeyAndVisible()
    }
}

protocol Router {
    var di: DIContainer? { get set }
    func start()
    func searchScreenOpen()
    func searchCity(_ name: String)
    func popToRoot()
}

