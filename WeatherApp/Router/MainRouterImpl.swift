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
    private let mainScreenDIContainer: MainScreenDIContainer
    private let searchScreenDIContainer: SearchScreenDIContainer
    
    // MARK: - Lifecycle
    init(with navigationController: UINavigationController, mainScreenDIContainer: MainScreenDIContainer, searchScreenDIContainer: SearchScreenDIContainer) {
        self.navigationController = navigationController
        self.mainScreenDIContainer = mainScreenDIContainer
        self.searchScreenDIContainer = searchScreenDIContainer
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
        let mainScreenViewController = mainScreenDIContainer.createMainViewControllerWithRouter(self)
        navigationController.pushViewController(mainScreenViewController, animated: true)
    }
    
    public func openSearchScreen(withCompletion completion: @escaping (String) -> Void) {
        let searchVC = searchScreenDIContainer.createSearchViewControllerWithRouter(self, withCompletion: completion)
        navigationController.present( searchVC, animated: true)
    }
    
    public func popToRoot() {
        navigationController.topViewController?.dismiss(animated: false, completion: nil)
        navigationController.popToRootViewController(animated: true)
    }
}
