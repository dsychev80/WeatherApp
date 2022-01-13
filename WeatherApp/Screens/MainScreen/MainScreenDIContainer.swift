//
//  MainScreenDIContainer.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.12.2021.
//

import UIKit
import NeedleFoundation

protocol MainScreenDependency: Dependency {
    var networkController: NetworkManager { get }
    var locationManager: LocationManager { get }
}

class MainScreenDependencyComponent: Component<MainScreenDependency> {
    var mainScreenDIContainer: MainScreenDIContainer {
        return MainScreenDIContainer(with: dependency.networkController, locationManager: dependency.locationManager)
    }
}

class MainScreenDIContainer {
    private let networkController: NetworkManager
    private let locationManager: LocationManager
    private let mainPresenter: MainPresenter
    
    init(with networkManager: NetworkManager, locationManager: LocationManager) {
        self.networkController = networkManager
        self.locationManager = locationManager
        self.mainPresenter = MainPresenterImpl(with: networkController, locationManager: locationManager)
    }
    
    public func createMainViewControllerWithRouter(_ router: MainRouter) -> UIViewController {
        let mainViewController = MainViewController()
        self.mainPresenter.router = router
        mainViewController.presenter = self.mainPresenter
        return mainViewController
    }
}
