//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import UIKit


final class AppCoordinator {
    // MARK: - Properties
    var navigationController: UINavigationController
    var mainRouter: MainRouter
    
    // MARK: - Lifecycle
    init(with window: UIWindow) {
        self.navigationController = UINavigationController()
        self.mainRouter = MainRouterImpl(with: navigationController)
        self.mainRouter.di = self
        self.mainRouter.start()
        
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
}

protocol MainRouter {
    var di: AppCoordinator! { get set }
    func start()
    func openSearchScreen(withCompletion completion: @escaping (String) -> Void)
    func popToRoot()
}
