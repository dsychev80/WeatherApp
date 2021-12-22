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
    private var mainScreenFabric: MainScreenFabric?
    internal var di: AppCoordinator!
    
    // MARK: - Lifecycle
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
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
        mainScreenFabric = MainScreenFabricImpl(with: di)
        navigationController.pushViewController(mainScreenFabric!.createMainViewController(), animated: true)
    }
    
    public func searchScreenOpen() {
        let searchFabric = SearchScreenFabricImpl(with: di)
        let searchVC = searchFabric.createSearchViewController()
        navigationController.present( searchVC, animated: true)
    }
    
    func searchCity(_ name: String) {
        navigationController.topViewController?.dismiss(animated: false)
        guard let mainFabric = mainScreenFabric else { return }
        mainFabric.updateMainViewControllerForCity(name)
    }
    
    public func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}

    // MARK: - ScreenFabric protocol
protocol MainScreenFabric {
    func createMainViewController() -> UIViewController
    func updateMainViewControllerForCity(_ name: String)
}

protocol SearchScreenFabric {
    func createSearchViewController() -> UIViewController
}
