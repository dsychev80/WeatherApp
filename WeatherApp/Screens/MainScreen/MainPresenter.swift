//
//  DataController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation


final class MainPresenterImpl {
    // MARK: - Properties
    private let networkController: NetworkManager
    private let locationManager: LocationManager
    public weak var router: MainRouter!
    public weak var view: MainView!
    
    // MARK: - Lifecycle
    init(with networkController: NetworkManager, locationManager: LocationManager) {
        self.networkController = networkController
        self.locationManager = locationManager
    }
    
    // MARK: - Methods
    private func loadWeatherForCoordinates(_ coordinates: LocationData) {
        networkController.loadWeatherForLocation(coordinates) { [unowned self] result in
            switch result {
            case .failure(let error):
                view.showError(error.localizedDescription)
            case .success(let weather):
                self.view.provideForcastData(weather.convertToItems(),forCity: weather.city.name)
            
            }
        }
    }
}

// MARK: - MainPresenter
extension MainPresenterImpl: MainPresenter {
    public func recieveWeatherForCityName(_ name: String) {
        view.startLoadingWeather()
        locationManager.getCityCoordinatesByName(name) { [unowned self] result in
            switch result {
            case .failure(let error):
                view.showError(error.localizedDescription)
            case .success(let coordinates):
                self.loadWeatherForCoordinates(coordinates)
            }
        }
    }
}

    // MARK: - EventHandler
extension MainPresenterImpl: NavigationBarEventHandler {
    public func selectOnMap() {
        
    }
    
    public func search() {
        router.openSearchScreen { [unowned self] cityName in
            self.recieveWeatherForCityName(cityName)
        }
    }
    
    public func changeTheme() {
        
    }
}

    // MARK: - MainView
protocol MainView: AnyObject {
    func startLoadingWeather()
    func provideForcastData(_ data: [Item], forCity name: String)
    func showError(_ text: String)
}

    // MARK: - LocationManager
protocol LocationManager {
    func getCityCoordinatesByName(_ name: String, completion: @escaping (Result<LocationData, WeatherError>) -> Void)
}

    // MARK: - NetworkManager
protocol NetworkManager {
    func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<JSONWeatherData, WeatherError>) -> Void)
}
