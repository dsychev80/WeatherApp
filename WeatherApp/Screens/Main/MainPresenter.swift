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
    public var router: Router
    public var mainViewController: MainViewProtocol!
    
    // MARK: - Lifecycle
    init(with networkController: NetworkManager, locationManager: LocationManager, router: Router) {
        self.networkController = networkController
        self.locationManager = locationManager
        self.router = router
    }
    
    // MARK: - Methods
    public func recieveWeatherForCityName(_ name: String) {
        locationManager.getCityCoordinatesByName(name) { [weak self] result in
            guard let self = self else {
                print("guard condition not met at: \(#file) \(#line) \(#function)")
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
            guard let self = self else {
                print("guard condition not met at: \(#file) \(#line) \(#function)")
                return
            }
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
    @objc func selectOnMap() {
        
    }
    
    @objc func search() {
        router.searchScreenOpen()
    }
    
    @objc func changeTheme() {
        print("change theme")
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
