//
//  CitySearchPresenter.swift
//  WeatherApp
//
//  Created by Denis Sychev on 16.12.2021.
//

import Foundation

class CitySearchPresenterImpl: CitySearchPresenter {
    // MARK: - Properties
    weak var searchViewController: CitySearchView!
    public var router: Router
    
    let cities = ["Тамбов", "Тюмень", "Тула", "Темрюк", "Таганрог", "Тьматараканья", "Тбилисси"]
    
    // MARK: - Lifecycle
    init(with router: Router) {
        self.router = router
    }
    
    // MARK: - Methods
    public func provideCities() -> [String] {
        return cities
    }
    
    public func searchCityWithName(_ name: String) {
        router.searchCity(name)
    }
    
    public func dismiss() {
        router.popToRoot()
    }
}
