//
//  DIConteiner.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation
import UIKit


final class DIContainer {
    
    let networkController: NetworkController
    let locationManager: LocationManager
    let dataController: DataController
    
    init() {
        self.networkController = NetworkController()
        self.locationManager = LocationManagerImp()
        self.dataController = DataController(with: networkController, locationManager: locationManager)
    }
    
}

extension DIContainer {
    
    public func configureMainViewController() -> UIViewController {
        return MainViewController(with: dataController)
    }
    
    public func configureCitySearchViewController() -> UIViewController {
        return CitySearchViewController(with: dataController as CityDataDelegate)
    }

}


