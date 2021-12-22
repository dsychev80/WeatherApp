//
//  ScreenFabric.swift
//  WeatherApp
//
//  Created by Denis Sychev on 16.12.2021.
//
import UIKit

class MainScreenFabricImpl: MainScreenFabric {
    private let di: DIContainer
    
    init(with di: DIContainer) {
        self.di = di
    }
    
    public func createMainViewController() -> UIViewController {
        let mainViewController = MainViewController()
        mainViewController.presenter = di.mainPresenter
        di.mainPresenter.mainViewController = mainViewController
        return mainViewController
    }
}
