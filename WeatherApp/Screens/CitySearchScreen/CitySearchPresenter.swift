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
    public var view: CitySearchView!
    public var searchCompletion: ((String) -> Void)?
    private let searchCityNameUseCase = SearchCityNameUseCase()
    
    var cities: [String] = []
    
    // MARK: - Methods
    public func provideCities(contains text: String) -> [String] {
        searchCityNameUseCase.getCityNames(contains: text) { [weak self] answer in
            guard let self = self else { return }
            self.cities = answer
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
