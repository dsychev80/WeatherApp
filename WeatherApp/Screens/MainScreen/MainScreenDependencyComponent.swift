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
    
    var mainInteractor: MainInteractor {
        return shared { MainInteractorImpl(with: dependency.locationManager, networkController: dependency.networkController) }
    }
    
    var mainPresenter: MainPresenter {
        return shared { MainPresenterImpl(with: self.mainInteractor) }
    }

    public func createMainViewControllerWithRouter(_ router: MainRouter) -> UIViewController {
        let mainViewController = MainViewController()
        mainPresenter.router = router
        mainViewController.presenter = mainPresenter
        return mainViewController
    }
}
