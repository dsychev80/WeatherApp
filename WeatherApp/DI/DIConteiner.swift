//
//  DIConteiner.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import UIKit


final class DIContainer {
    // MARK: - Properties
    var navigationController: UINavigationController
    var mainRouter: Router
    
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

protocol Router {
    var di: DIContainer! { get set }
    func start()
    func searchScreenOpen()
    func searchCity(_ name: String)
    func popToRoot()
}
