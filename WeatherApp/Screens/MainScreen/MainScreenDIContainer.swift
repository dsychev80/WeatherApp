//
//  MainScreenDIContainer.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.12.2021.
//

import UIKit

class MainScreenDIContainer {
    let networkController: NetworkManager
    let locationManager: LocationManager
    let mainPresenter: MainPresenter
    
    init(with di: AppCoordinator) {
        self.networkController = MainScreenDIContainer.createNetworkManager()
        self.locationManager = MainScreenDIContainer.createLocationManager()
        self.mainPresenter = MainPresenterImpl(with: networkController, locationManager: locationManager, router: di.mainRouter)
    }
    
    private static func createNetworkManager() -> NetworkManager {
        return NetworkProvider()
    }
    
    private static func createLocationManager() -> LocationManager {
        return LocationManagerImpl()
    }
    
    public func createMainViewController() -> UIViewController {
        let mainViewController = MainViewController()
        mainViewController.presenter = self.mainPresenter
        return mainViewController
    }
}
