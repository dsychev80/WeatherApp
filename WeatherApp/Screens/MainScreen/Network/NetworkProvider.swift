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

        AF.request(url).validate().responseDecodable(of: JSONWeatherData.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(WeatherError.errorFromLocationServer(error.localizedDescription)))
            }
        }
    }
}
