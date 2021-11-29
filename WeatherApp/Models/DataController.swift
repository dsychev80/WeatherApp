//
//  DataController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation

protocol CityDataDelegate: AnyObject {
    func recievedCityName(_ name: String)
}

final class DataController {
    
    // MARK: - Properties
    private let networkController: NetworkController
    private let locationManager: LocationManager
    
    private var data: WeatherModel?
    
    // MARK: - Lifecycle
    init(with networkController: NetworkController, locationManager: LocationManager) {
        self.networkController = networkController
        self.locationManager = locationManager
    }
    
    // MARK: - Methods
    private func loadWeatherForCoordinates(_ coordinates: LocationData) {
        networkController.loadWeatherForLocation(coordinates) { [weak self] result in
            switch result {
            case .failure(let error):
                // FIXME: Handle error
                print(error.localizedDescription)
            case .success(let weather):
                // FIXME: Handle answer
                print(weather)
                self?.data = weather
            }
        }
    }
}

extension DataController: CityDataDelegate {
    func recievedCityName(_ name: String) {
        locationManager.getCityCoordinatesByName(name) { [weak self] result in
            guard let self = self else {
                print("DataController is deallocated, so closure need to terminate too.")
                return
            }
            switch result {
            case .failure(let error):
                // MARK: need to handle the error
                print(error)
            case .success(let coordinates):
                self.loadWeatherForCoordinates(coordinates)
            }
        }
    }
}
