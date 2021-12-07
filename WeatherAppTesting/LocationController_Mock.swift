//
//  LocationController_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 07.12.2021.
//

import Foundation
@testable import WeatherApp

class LocationController_Mock: LocationManager {
    func getCityCoordinatesByName(_ name: String, completion: @escaping (Result<LocationData, WeatherError>) -> Void) {
        if name == "Tambov" || name == "Тамбов" {
            completion(.success(LocationData(longitude: 41.4517589, lattitude: 52.7211462)))
        } else {
            completion(.failure(.missingLocation("Enter Tambov or Тамбов")))
        }
    }
}
