//
//  ScreenFabric.swift
//  WeatherApp
//
//  Created by Denis Sychev on 16.12.2021.
//
import UIKit

class MainScreenFabricImpl: MainScreenFabric {
    private let di: MainScreenDIContainer
    
    init(with di: AppCoordinator) {
        self.di = MainScreenDIContainer(with: di)
    }
    
    public func createMainViewController() -> UIViewController {
        let mainViewController = MainViewController()
        mainViewController.presenter = di.mainPresenter
        return mainViewController
    }
}
