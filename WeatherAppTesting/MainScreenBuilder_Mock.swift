//
//  MainScreenBuilder_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 17.01.2022.
//

import UIKit
@testable import WeatherApp

class MainScreenBuilder_Mock: MainScreenBuilder {
    
    let mainPresenter: MainPresenter
    let mainInteractor: MainInteractor
    
    init(networkController: NetworkManager, locationManager: LocationManager) {
        self.mainInteractor = MainInteractorImpl(with: locationManager, networkController: networkController)
        self.mainPresenter =  MainPresenterImpl(with: mainInteractor)
    }
    
    func createMainViewControllerWithRouter(_ router: MainRouter) -> UIViewController {
        let mainViewController = MainView_Mock()
        mainViewController.presenter = mainPresenter
        mainPresenter.router = router
        return mainViewController
    }
}
