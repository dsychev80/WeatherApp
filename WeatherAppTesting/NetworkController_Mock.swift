//
//  NetworkController_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 06.12.2021.
//

import Foundation
@testable import WeatherApp

class NetworkController_Mock: NetworkManager {
    var dataJson = WeatherDataForTest.jsonData
    func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<JSONWeatherData, WeatherError>) -> Void) {
        if location == LocationData(longitude: 41.4517589, lattitude: 52.7211462) {
            completion(.success(dataJson))
        } else {
            completion(.failure(.serverError("No data")))
        }
    }
}
