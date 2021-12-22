//
//  ScreenFabric.swift
//  WeatherApp
//
//  Created by Denis Sychev on 16.12.2021.
//
import UIKit

class MainScreenFabricImpl: MainScreenFabric {
    private let di: MainScreenDIContainer
    
    init(with di: DIContainer) {
        self.di = MainScreenDIContainer(with: di)
    }
    
    public func createMainViewController() -> UIViewController {
        let mainViewController = MainViewController()
        mainViewController.presenter = di.mainPresenter
        return mainViewController
    }
    
    public func updateMainViewControllerForCity(_ name: String) {
        di.mainPresenter.recieveWeatherForCityName(name)
    }
}
