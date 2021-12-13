//
//  DIConteiner.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation
import UIKit


final class DIContainer {
    // MARK: - Properties
    let networkController: NetworkManager
    let locationManager: LocationManager
    let mainPresenter: MainPresenter
    
    // MARK: - Lifecycle
    init() {
        self.networkController = NetworkProvider()
        self.locationManager = LocationManagerImpl()
        self.mainPresenter = MainPresenterImpl(with: networkController, locationManager: locationManager)
    }
    
}

extension DIContainer {
    
    public func configureMainViewController() -> UIViewController {
        return MainViewController(with: mainPresenter)
    }
    
    public func configureCitySearchViewController() -> UIViewController {
        return CitySearchViewController(with: mainPresenter as! CityDataDelegate)
    }
}


