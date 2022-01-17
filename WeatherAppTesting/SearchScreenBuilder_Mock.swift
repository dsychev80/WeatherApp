//
//  SearchScreenBuilder_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 17.01.2022.
//
@testable import WeatherApp
import UIKit

class SearchScreenBuilder_Mock: SearchScreenBuilder {
    var presenter: CitySearchPresenter {
        return CitySearchPresenterImpl()
    }
    
    public func createSearchViewControllerWithRouter(_ router: MainRouter, withCompletion completion: @escaping (String) -> Void ) -> UIViewController {
        let searchVC = CitySearchViewController(with: self.presenter)
        return searchVC
    }
}
