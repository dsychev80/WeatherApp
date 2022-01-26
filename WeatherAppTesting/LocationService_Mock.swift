//
//  LocationService_Mock.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 07.12.2021.
//

import Foundation
@testable import WeatherApp

class LocationService_Mock: LocationService {
    
    public var isCalled: Bool = false
    public var mockName: String?
    public var mockResult: Result<LocationData, WeatherError>!
    
    func getCityCoordinatesByName(_ name: String, completion: @escaping (Result<LocationData, WeatherError>) -> Void) {
        isCalled = true
        mockName = name
        completion(mockResult)
    }
}
