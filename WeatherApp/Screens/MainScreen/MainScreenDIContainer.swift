//
//  MainScreenDIContainer.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.12.2021.
//

import Foundation

class MainScreenDIContainer {
    let networkController: NetworkManager
    let locationManager: LocationManager
    let mainPresenter: MainPresenter
    
    init(with di: DIContainer) {
        self.networkController = NetworkProvider()
        self.locationManager = LocationManagerImpl()
        self.mainPresenter = MainPresenterImpl(with: networkController, locationManager: locationManager, router: di.mainRouter)
    }
}
