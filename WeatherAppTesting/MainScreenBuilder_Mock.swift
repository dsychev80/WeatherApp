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
    let mainInteractor: WeatherSearchForCityUseCase
    
    init(networkService: NetworkService, locationService: LocationService) {
        self.mainInteractor = WeatherSearchForCityUseCaseImpl(with: locationService, networkService: networkService)
        self.mainPresenter =  MainPresenterImpl(with: mainInteractor)
    }
    
    func createMainViewControllerWithRouter(_ router: MainRouter) -> UIViewController {
        let mainViewController = MainView_Mock()
        mainViewController.presenter = mainPresenter
        mainPresenter.router = router
        return mainViewController
    }
}
