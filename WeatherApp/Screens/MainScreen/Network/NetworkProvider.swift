//
//  NetworkProvider.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Alamofire


final class NetworkProvider: NetworkManager {
    
    private enum Constants: String {
        case url
        case apiKey = "appid"
        case lang
        case units
        case lon
        case lat
        
        func returnValue() -> String {
            switch self {
            case .url:
                return "https://api.openweathermap.org/data/2.5/forecast?"
            case .apiKey:
                return "08e77799ad87c75f8ae1192abab79639"
            case .lang:
                return "ru"
            case .units:
                return "metric"
            default:
                return ""
            }
        }
    }
    
    public func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<JSONWeatherData, WeatherError>) -> Void) {
        
        let parameters: [String: String] = [Constants.apiKey.rawValue: Constants.apiKey.returnValue(), Constants.lang.rawValue: Constants.lang.returnValue(), Constants.units.rawValue: Constants.units.returnValue(), Constants.lon.rawValue: location.stringLong, Constants.lat.rawValue: location.stringLatt]

        AF.request(Constants.url.returnValue(), parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: JSONWeatherData.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(WeatherError.errorFromLocationServer(error.localizedDescription)))
                }
        }
    }
}
