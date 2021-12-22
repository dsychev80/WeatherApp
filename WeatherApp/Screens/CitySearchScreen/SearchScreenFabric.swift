//
//  SearchScreenFabric.swift
//  WeatherApp
//
//  Created by Denis Sychev on 21.12.2021.
//

import UIKit


class SearchScreenFabricImpl: SearchScreenFabric {
    let di: SearchScreenDIContainer
    
    init(with di: DIContainer) {
        self.di = SearchScreenDIContainer(with: di)
    }
    
    public func createSearchViewController() -> UIViewController {
        let searchVC = CitySearchViewController(with: di.presenter)
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        return searchVC
    }
}
