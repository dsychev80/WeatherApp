//
//  DataController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation
import UIKit


final class MainPresenter {
    
    // MARK: - Properties
    private let networkController: NetworkController
    private let locationManager: LocationManager
    public weak var dataRecivier: MainDataRecivier?
    
    public weak var mainViewController: MainViewController!
    
    // MARK: - Lifecycle
    init(with networkController: NetworkController, locationManager: LocationManager) {
        self.networkController = networkController
        self.locationManager = locationManager
    }
    
    // MARK: - Methods
    private func loadWeatherForCoordinates(_ coordinates: LocationData) {
        networkController.loadWeatherForLocation(coordinates) { [weak self] result in
            DispatchQueue.main.async {
                
                switch result {
                case .failure(let error):
                    // FIXME: Handle error
                    print(error.localizedDescription)
                case .success(let weather):
                    // FIXME: Handle answer
                    self?.mainViewController.provideForcastData(weather)
                    self?.dataRecivier?.dataReciviedForCity(weather.city.name)
                }
            }
        }
    }
}

extension MainPresenter: CityDataDelegate {
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

protocol MainDataRecivier: AnyObject {
    func dataReciviedForCity(_ name: String)
}

protocol LocationManager {
    func getCityCoordinatesByName(_ name: String, completion: @escaping (Result<LocationData, WeatherError>) -> Void)
}
