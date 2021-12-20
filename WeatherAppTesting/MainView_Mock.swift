//
//  MainView_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 07.12.2021.
//

import Foundation
@testable import WeatherApp

class MainView_Mock: MainViewProtocol {
    var isCalledProvideForcastData: Bool = false
    
    var nameRecivied: String = ""
    var dataReceived: [Item]?
    
    func provideForcastData(_ data: [Item], forCity name: String) {
        isCalledProvideForcastData = true
        dataReceived = data
        nameRecivied = name
    }
}
