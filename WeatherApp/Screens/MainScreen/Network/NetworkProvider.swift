//
//  NetworkProvider.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Alamofire


final class NetworkProvider: NetworkManager {
    
    public func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<JSONWeatherData, WeatherError>) -> Void) {

        var api = WeatherResource()
        api.addLocation(location)
        guard let url = api.url else {
            print("guard condition not met at: \(#file) \(#line) \(#function)")
            return
        }

        AF.request(url)
            .validate()
            .responseDecodable(of: JSONWeatherData.self) { response in
                guard let statusCode = response.response?.statusCode else { return }
                if (200..<300).contains(statusCode) {
                    switch response.result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(WeatherError.errorFromLocationServer(error.localizedDescription)))
                    }
                } else if (400..<500).contains(statusCode) {
                    completion(.failure(WeatherError.clientError(response.error?.localizedDescription ?? "Server can't operate request. Status code is \(statusCode)")))
                } else if (500..<600).contains(statusCode) {
                    completion(.failure(WeatherError.serverError(response.error?.localizedDescription ?? "Server error. Status code is \(statusCode)")))
                }
        }
    }
}
