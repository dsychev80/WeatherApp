//
//  NetworkController_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 06.12.2021.
//

import Foundation
@testable import WeatherApp

class NetworkController_Mock: NetworkManager {
    func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<JSONWeatherData, WeatherError>) -> Void) { 
        
    }
}
