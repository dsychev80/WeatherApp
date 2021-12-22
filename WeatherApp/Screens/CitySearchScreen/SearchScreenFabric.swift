//
//  SearchScreenFabric.swift
//  WeatherApp
//
//  Created by Denis Sychev on 21.12.2021.
//

import UIKit


class SearchScreenFabricImpl: SearchScreenFabric {
    let di: DIContainer
    
    init(with di: DIContainer) {
        self.di = di
    }
    
    public func createSearchViewController() -> UIViewController {
        let presenter = CitySearchPresenterImpl(with: di.mainRouter)
        let searchVC = CitySearchViewController(with: presenter)
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        return searchVC
    }
}
