//
//  MainView_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 07.12.2021.
//

@testable import WeatherApp
import UIKit

class MainView_Mock: UIViewController, MainView {
    
    var presenter: MainPresenter!
    
    var isCalledStartLoadingWeather: Bool = false
    var isCalledProvideForcastData: Bool = false
    var isCalledShowError: Bool = false
    
    var nameRecivied: String = ""
    var dataReceived: [Item]?
    
    func startLoadingWeather() {
        isCalledStartLoadingWeather = true
    }
    
    func provideForcastData(_ data: [Item], forCity name: String) {
        isCalledProvideForcastData = true
        dataReceived = data
        nameRecivied = name
    }
    
    func showError(_ text: String) {
        isCalledShowError = true
    }
}
