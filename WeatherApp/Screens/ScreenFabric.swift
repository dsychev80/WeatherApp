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
    public func createMainViewController() -> UIViewController {
        guard let di = di else { fatalError() }
        let mainViewController = MainViewController()
        mainViewController.presenter = di.mainPresenter
        di.mainPresenter.mainViewController = mainViewController
        return mainViewController
    }
    
    public func createSearchViewController() -> UIViewController {
        guard let di = di else { fatalError() }
        let presenter = CitySearchPresenterImpl(with: di.mainRouter)
        let searchVC = CitySearchViewController(with: presenter)
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        return searchVC
    }
}

