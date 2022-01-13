//
//  SearchScreenDIContainer.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.12.2021.
//

import UIKit

class SearchScreenDIContainer {
    public let presenter: CitySearchPresenter
    
    init(with di: AppCoordinator) {
        self.presenter = CitySearchPresenterImpl(with: di.router)
    }
}

extension SearchScreenDIContainer: SearchScreenFabric {
    public func createSearchViewController(withCompletion completion: @escaping (String) -> Void ) -> UIViewController {
        let searchVC = CitySearchViewController(with: self.presenter)
        self.presenter.searchCompletion = completion
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        return searchVC
    }
}
