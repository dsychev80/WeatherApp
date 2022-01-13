//
//  SearchScreenDIContainer.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.12.2021.
//

import UIKit
import NeedleFoundation


class SearchScreenDependencyComponent: Component<EmptyDependency> {
    
    var searchScreenDependency: SearchScreenDIContainer {
        SearchScreenDIContainer()
    }
}

class SearchScreenDIContainer {
    public let presenter: CitySearchPresenter
    
    init() {
        self.presenter = CitySearchPresenterImpl()
    }

    public func createSearchViewControllerWithRouter(_ router: MainRouter, withCompletion completion: @escaping (String) -> Void ) -> UIViewController {
        let searchVC = CitySearchViewController(with: self.presenter)
        self.presenter.router = router
        self.presenter.searchCompletion = completion
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        return searchVC
    }
}
