//
//  MainCoordinator.swift
//  WeatherApp
//
//  Created by Denis Sychev on 15.12.2021.
//

import UIKit

class MainCoordinator: Coordinator {
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
    
    public func start() {
        showMainScreen()
    }
    
    func showMainScreen() {
        navigationController.pushViewController(screenFabric.configureMainViewController(), animated: true)
    }
}

protocol ScreenFabric {
    func configureMainViewController() -> UIViewController
}
