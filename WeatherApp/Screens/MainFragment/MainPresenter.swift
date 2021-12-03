//
//  DataController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation
import UIKit


final class MainPresenter: NSObject {
    
    // MARK: - Properties
    private let networkController: NetworkController
    private let locationManager: LocationManager
    public weak var dataRecivier: MainDataRecivier?
    
    public weak var mainViewController: MainViewController!
    
    private var weather: JSONWeatherData?
    private var forecast: [ForecastData] = []
    
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
                    self?.weather = weather
                    self?.forecast = weather.convertToForecastByDay()
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

extension MainPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let currentDayCell = TodayCell(style: .default, reuseIdentifier: TodayCell.name)
            guard let data = weather, let currentWeather = data.list.first else { return currentDayCell } // Returns cell without data
            currentDayCell.configure(with: currentWeather)
            return currentDayCell
        } else {
            let recentDayWeather = forecast[indexPath.row]
            let recentDayCell = RecentDayCell()
            recentDayCell.configure(with: recentDayWeather)
            return recentDayCell
        }
    }
}

protocol MainDataRecivier: AnyObject {
    func dataReciviedForCity(_ name: String)
}

protocol LocationManager {
    func getCityCoordinatesByName(_ name: String, completion: @escaping (Result<LocationData, WeatherError>) -> Void)
}
