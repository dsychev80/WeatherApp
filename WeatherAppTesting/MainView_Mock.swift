//
//  MainView_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 07.12.2021.
//

import Foundation
@testable import WeatherApp

class MainView_Mock: MainView {
    
    var isCalledProvideForcastData: Bool = false
    var isCalledReciviedForCity: Bool = false
    
    var nameRecivied: String = ""
    var dataReceived: JSONWeatherData?
    
    func provideForcastData(_ data: JSONWeatherData) {
        isCalledProvideForcastData = true
        dataReceived = data
    }
    
    func dataReciviedForCity(_ name: String) {
        isCalledReciviedForCity = true
        nameRecivied = name
    }
}
