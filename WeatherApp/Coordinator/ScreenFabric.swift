//
//  ScreenFabric.swift
//  WeatherApp
//
//  Created by Denis Sychev on 16.12.2021.
//

import UIKit


final class ScreenFabricImpl: ScreenFabric {
    // MARK: - Properties
    var di: DIContainer?
    
    // MARK: - Methods
    public func configureMainViewController() -> UIViewController {
        guard let di = di else { fatalError() }
        let presenter = MainPresenterImpl(with: di.networkController, locationManager: di.locationManager, router: di.mainRouter)
        let mainViewController = MainViewController(with: presenter)        
        return mainViewController
    }
}

