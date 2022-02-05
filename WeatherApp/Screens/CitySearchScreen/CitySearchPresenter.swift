//
//  CitySearchPresenter.swift
//  WeatherApp
//
//  Created by Denis Sychev on 16.12.2021.
//

import Foundation

class CitySearchPresenterImpl: CitySearchPresenter {
    // MARK: - Properties
    public var router: MainRouter!
    public var searchCompletion: ((String) -> Void)?
    private let searchCityNameUseCase = SearchCityNameUseCase()
    
    var cities: [String] = []
    
    // MARK: - Methods
    public func provideCities() -> [String] {
        searchCityNameUseCase.getCityNames(contains: "Astr") { [weak self] answer in
            self?.cities = answer
        }
        return cities
    }
    
    public func searchCityWithName(_ name: String) {
        dismiss()
        if let completion = searchCompletion {
            completion(name)
        }
    }
    
    public func dismiss() {
        router.popToRoot()
    }
}
