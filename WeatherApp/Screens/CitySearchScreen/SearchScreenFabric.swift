//
//  SearchScreenFabric.swift
//  WeatherApp
//
//  Created by Denis Sychev on 21.12.2021.
//

import UIKit


class SearchScreenFabricImpl: SearchScreenFabric {
    let di: SearchScreenDIContainer
    
    init(with di: AppCoordinator) {
        self.di = SearchScreenDIContainer(with: di)
    }
    
    public func createSearchViewController(withCompletion completion: @escaping (String) -> Void ) -> UIViewController {
        let searchVC = CitySearchViewController(with: di.presenter)
        di.presenter.searchCompletion = completion
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        return searchVC
    }
}
