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
    
    let cities = ["Тамбов", "Тюмень", "Тула", "Темрюк", "Таганрог", "Тьматараканья", "Тбилисси"]
    
    // MARK: - Methods
    public func provideCities() -> [String] {
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
