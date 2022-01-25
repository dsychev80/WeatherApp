//
//  WeatherSearchForCityUseCase.swift
//  WeatherApp
//
//  Created by Denis Sychev on 20.01.2022.
//

import Foundation

final class WeatherSearchForCityUseCaseImpl {
    // MARK: - Properties
    private let locationController: LocationManager
    private let networkController: NetworkManager
    
    // MARK: - Lifecycle
    init(with locationController: LocationManager, networkController: NetworkManager) {
        self.locationController = locationController
        self.networkController = networkController
    }
    
}

extension WeatherSearchForCityUseCaseImpl: WeatherSearchForCityUseCase {
    public func fetchWeatherFor(city: String, with completion: @escaping (Result<[Item], WeatherError>) -> Void) {
        locationController.getCityCoordinatesByName(city) { [unowned self] result in
            switch result {
            case .success(let location):
                self.networkController.loadWeatherForLocation(location) { result in
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
