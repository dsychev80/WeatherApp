//
//  MainScreenDependencyComponent.swift
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

class MainScreenDependencyComponent: Component<MainScreenDependency>, MainScreenBuilder {
    
    var mainPresenter: MainPresenter {
        return shared { MainPresenterImpl(with: dependency.networkController, locationManager: dependency.locationManager) }
    }

    public func createMainViewControllerWithRouter(_ router: MainRouter) -> UIViewController {
        let mainViewController = MainViewController()
        mainPresenter.router = router
        mainViewController.presenter = mainPresenter
        return mainViewController
    }
}
