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
    private var router: MainRouter
    public weak var mainViewController: MainViewProtocol!
    
    // MARK: - Lifecycle
    init(with networkController: NetworkManager, locationManager: LocationManager, router: MainRouter) {
        self.networkController = networkController
        self.locationManager = locationManager
        self.router = router
    }
    
    // MARK: - Methods
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
    
    private func loadWeatherForCoordinates(_ coordinates: LocationData) {
        networkController.loadWeatherForLocation(coordinates) { [unowned self] result in
            switch result {
            case .failure(let error):
                // FIXME: Handle error
                print(error.localizedDescription)
            case .success(let weather):
                self.mainViewController.provideForcastData(weather.convertToItems(),forCity: weather.city.name)
            
            }
        }
    }
}

    // MARK: - EventHandler
extension MainPresenterImpl: NavigationBarEventHandler {
    public func selectOnMap() {
        
    }
    
    public func search() {
        router.searchScreenOpen()
    }
    
    public func changeTheme() {
        
    }
}

    // MARK: - MainViewProtocol
protocol MainViewProtocol: AnyObject {
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
