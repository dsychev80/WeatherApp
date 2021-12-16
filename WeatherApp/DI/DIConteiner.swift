//
//  DIConteiner.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import UIKit


final class DIContainer {
    // MARK: - Properties
    let networkController: NetworkManager
    let locationManager: LocationManager
    var screenFabric: ScreenFabric
    
    var navigationController: UINavigationController
    let mainPresenter: MainPresenter
    var mainRouter: Router
    
    // MARK: - Lifecycle
    init() {
        self.networkController = NetworkProvider()
        self.locationManager = LocationManagerImpl()
        self.screenFabric = ScreenFabricImpl()
        self.navigationController = UINavigationController()
        self.mainRouter = MainRouterImpl(with: navigationController, and: screenFabric)
        self.mainPresenter = MainPresenterImpl(with: networkController, locationManager: locationManager, router: mainRouter)
        self.screenFabric.di = self
    }
}
