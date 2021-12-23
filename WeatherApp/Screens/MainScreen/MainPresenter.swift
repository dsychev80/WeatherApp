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
    private var router: MainRouter
    public weak var view: MainView!
    
    // MARK: - Lifecycle
    init(with networkController: NetworkManager, locationManager: LocationManager, router: MainRouter) {
        self.networkController = networkController
        self.locationManager = locationManager
        self.router = router
    }
    
    // MARK: - Methods
    private func loadWeatherForCoordinates(_ coordinates: LocationData) {
        networkController.loadWeatherForLocation(coordinates) { [unowned self] result in
            switch result {
            case .failure(let error):
                // FIXME: Handle error
                print(error.localizedDescription)
            case .success(let weather):
                self.view.provideForcastData(weather.convertToItems(),forCity: weather.city.name)
            
            }
        }
    }
}

// MARK: - MainPresenter
extension MainPresenterImpl: MainPresenter {
    public func recieveWeatherForCityName(_ name: String) {
        locationManager.getCityCoordinatesByName(name) { [unowned self] result in
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
    func provideForcastData(_ data: [Item], forCity name: String)
}

    // MARK: - LocationManager
protocol LocationManager {
    func getCityCoordinatesByName(_ name: String, completion: @escaping (Result<LocationData, WeatherError>) -> Void)
}

    // MARK: - NetworkManager
protocol NetworkManager {
    func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<JSONWeatherData, WeatherError>) -> Void)
}
