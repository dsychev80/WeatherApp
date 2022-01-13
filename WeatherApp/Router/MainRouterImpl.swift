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
    
    // MARK: - Lifecycle
    init(with navigationController: UINavigationController, mainScreenDIContainer: MainScreenDIContainer) {
        self.navigationController = navigationController
        self.mainScreenDIContainer = mainScreenDIContainer
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
        let mainScreenViewController = mainScreenDIContainer.createMainViewController()
        navigationController.pushViewController(mainScreenViewController, animated: true)
    }
    
    public func openSearchScreen(withCompletion completion: @escaping (String) -> Void) {
//        let searchFabric = SearchScreenDIContainer(with: di)
//        let searchVC = searchFabric.createSearchViewController(withCompletion: completion)
//        navigationController.present( searchVC, animated: true)
    }
    
    public func popToRoot() {
        navigationController.topViewController?.dismiss(animated: false, completion: nil)
        navigationController.popToRootViewController(animated: true)
    }
}

    // MARK: - ScreenFabric protocol
protocol MainScreenFabric {
    func createMainViewController() -> UIViewController
}

protocol SearchScreenFabric {
    func createSearchViewController(withCompletion completion: @escaping (String) -> Void) -> UIViewController
}
