//
//  NetworkController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation

protocol NetworkDataUserDelegate: AnyObject {
    func dataEndLoading()
}

final class NetworkController {
    
    private weak var dataUser: NetworkDataUserDelegate?
    
    init() { }
    
    public func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<WeatherData, WeatherError>) -> Void) {
        
        var api = WeatherResource()
        api.addLocation(location)
        guard let url = api.url else { return }
        
        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(.failure(WeatherError.serverError(error?.localizedDescription ?? "Unrecognized network error")))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(WeatherData.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(WeatherError.decodingError(error.localizedDescription)))
            }

        }.resume()
    }
}
