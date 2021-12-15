//
//  DataController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation


final class MainPresenterImpl: MainPresenter {
    
    // MARK: - Properties
    private let networkController: NetworkManager
    private let locationManager: LocationManager
    public weak var mainViewController: MainView!
    
    // MARK: - Lifecycle
    init(with networkController: NetworkManager, locationManager: LocationManager) {
        self.networkController = networkController
        self.locationManager = locationManager

//        loadWeatherForCoordinates(LocationData(longitude: 52.7211, lattitude: 41.4518))
    }
    
    // MARK: - Methods
    public func recieveWeatherForCityName(_ name: String) {
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
    
    public func loadWeatherForCoordinates(_ coordinates: LocationData) {
        networkController.loadWeatherForLocation(coordinates) { [weak self] result in
            switch result {
            case .failure(let error):
                // FIXME: Handle error
                print(error.localizedDescription)
            case .success(let weather):
                self?.mainViewController.provideForcastData(weather.convertToItems())
                self?.mainViewController?.dataReciviedForCity(weather.city.name)
            
            }
        }
    }
}

extension MainPresenterImpl: EventHandler {
    @objc func selectOnMap() {
        print("selectOnMap")
    }
    
    @objc func search() {
        print("search")
    }
    
    @objc func changeTheme() {
        print("change theme")
    }
}

protocol MainView: AnyObject {
    func provideForcastData(_ data: [Item])
    func dataReciviedForCity(_ name: String)
}

protocol LocationManager {
    func getCityCoordinatesByName(_ name: String, completion: @escaping (Result<LocationData, WeatherError>) -> Void)
}

protocol NetworkManager {
    func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<JSONWeatherData, WeatherError>) -> Void)
}
