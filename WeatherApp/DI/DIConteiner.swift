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
    init() {
        self.navigationController = UINavigationController()
        self.mainRouter = MainRouterImpl(with: navigationController)
        self.mainRouter.di = self
    }
}
