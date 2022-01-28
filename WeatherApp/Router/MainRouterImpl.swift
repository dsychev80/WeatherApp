//
//  MainRouterImpl.swift
//  WeatherApp
//
//  Created by Denis Sychev on 15.12.2021.
//

import UIKit

class MainRouterImpl {
    // MARK: - Properties
    private let navigationController: UINavigationController
    private let mainScreenBuilder: MainScreenBuilder
    private let searchScreenBuilder: SearchScreenBuilder
    
    // MARK: - Lifecycle
    init(with navigationController: UINavigationController, mainScreenBuilder: MainScreenBuilder, searchScreenBuilder: SearchScreenBuilder) {
        self.navigationController = navigationController
        self.mainScreenBuilder = mainScreenBuilder
        self.searchScreenBuilder = searchScreenBuilder
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        navigationController.setNavigationBarHidden(true, animated: false)
    }
}

    // MARK: - Router
extension MainRouterImpl: MainRouter {
    public func start() {
        let mainScreenViewController = mainScreenBuilder.createMainViewControllerWithRouter(self)
        navigationController.pushViewController(mainScreenViewController, animated: true)
    }
    
    public func openSearchScreen(withCompletion completion: @escaping (String) -> Void) {
        let searchVC = searchScreenBuilder.createSearchViewControllerWithRouter(self, withCompletion: completion)
        navigationController.present( searchVC, animated: true)
    }
    
    public func popToRoot() {
        if let topViewController = navigationController.topViewController {
            topViewController.dismiss(animated: false, completion: nil)
        } else {
            navigationController.popToRootViewController(animated: true)
        }
    }
}

protocol MainScreenBuilder {
    func createMainViewControllerWithRouter(_ router: MainRouter) -> UIViewController
}

protocol SearchScreenBuilder {
    func createSearchViewControllerWithRouter(_ router: MainRouter, withCompletion completion: @escaping (String) -> Void) -> UIViewController
}
