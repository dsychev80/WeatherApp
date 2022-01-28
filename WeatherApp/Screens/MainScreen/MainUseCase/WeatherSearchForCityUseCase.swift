//
//  WeatherSearchForCityUseCase.swift
//  WeatherApp
//
//  Created by Denis Sychev on 20.01.2022.
//

import Foundation

final class WeatherSearchForCityUseCaseImpl {
    // MARK: - Properties
    private let locationService: LocationService
    private let networkService: NetworkService
    
    // MARK: - Lifecycle
    init(with locationService: LocationService, networkService: NetworkService) {
        self.locationService = locationService
        self.networkService = networkService
    }
}

extension WeatherSearchForCityUseCaseImpl: WeatherSearchForCityUseCase {
    public func fetchWeatherFor(city: String, with completion: @escaping (Result<[Item], WeatherError>) -> Void) {
        locationService.getCityCoordinatesByName(city) { [unowned self] result in
            switch result {
            case .success(let location):
                self.networkService.loadWeatherForLocation(location) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data.convertToItems()))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

protocol WeatherSearchForCityUseCase {
    func fetchWeatherFor(city: String, with completion: @escaping (Result<[Item], WeatherError>) -> Void)
}

// MARK: - LocationService
protocol LocationService {
func getCityCoordinatesByName(_ name: String, completion: @escaping (Result<LocationData, WeatherError>) -> Void)
}

// MARK: - NetworkManager
protocol NetworkService {
func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<JSONWeatherData, WeatherError>) -> Void)
}

