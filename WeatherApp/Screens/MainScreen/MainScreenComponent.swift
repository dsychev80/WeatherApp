//
//  MainScreenComponent.swift
//  WeatherApp
//
//  Created by Denis Sychev on 11.01.2022.
//

import UIKit
import NeedleFoundation

protocol MainScreenDependency: Dependency {
    var networkController: NetworkManager { get }
    var locationManager: LocationManager { get }
    var router: MainRouter { get }
}

class MainScreenComponent: Component<MainScreenDependency> {
    var mainScreenPresenter: MainPresenter {
        return MainPresenterImpl(with: dependency.networkController, locationManager: dependency.locationManager, router: dependency.router)
    }
}
