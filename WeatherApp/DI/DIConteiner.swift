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
    
    var mainCoordinator: MainCoordinator?
    
    // MARK: - Lifecycle
    init() {
        self.networkController = NetworkProvider()
        self.locationManager = LocationManagerImpl()

        self.mainPresenter = MainPresenterImpl(with: networkController, locationManager: locationManager)
    }
}

extension DIContainer: ScreenFabric {
    public func configureMainViewController() -> UIViewController {
        guard let coordinator = mainCoordinator else { fatalError() }
        mainPresenter.coordinator = coordinator
        let mainViewController = MainViewController(with: mainPresenter)
        return mainViewController
    }
}
