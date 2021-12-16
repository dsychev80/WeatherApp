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
    private let screenFabric: ScreenFabric
    
    // MARK: - Lifecycle
    init(with navigationController: UINavigationController, and screenFabric: ScreenFabric) {
        self.navigationController = navigationController
        self.screenFabric = screenFabric
        
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    private func showMainScreen() {
        navigationController.pushViewController(screenFabric.configureMainViewController(), animated: true)
    }
}

// MARK: - Router
extension MainRouterImpl: Router {
    public func start() {
        showMainScreen()
    }
    
    public func searchScreenOpen() {
        navigationController.pushViewController(screenFabric.configureSearchViewController(), animated: true)
    }
    
    public func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}

// MARK: - ScreenFabric protocol
protocol ScreenFabric {
    var di: DIContainer? { get set }
    func configureMainViewController() -> UIViewController
    func configureSearchViewController() -> UIViewController
}
