//
//  MainView_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 07.12.2021.
//

import Foundation
@testable import WeatherApp

class MainView_Mock: MainView {
    
    var isCityNameCorrect: Bool = false
    var isForcastDataCorrect: Bool = false
    
    func provideForcastData(_ data: JSONWeatherData) {
        isForcastDataCorrect = checkForcastData(data)
    }
    
    func dataReciviedForCity(_ name: String) {
        isCityNameCorrect = checkReciviedCityName(name)
    }
    
    func checkForcastData(_ data: JSONWeatherData) -> Bool {
        return data.city.name == "Тамбов" && data.list.count > 0
    }
    
    func checkReciviedCityName(_ name: String) -> Bool {
        return name == "Тамбов"
    }
    
}
