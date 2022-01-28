//
//  NetworkServiceImpl.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Alamofire

fileprivate let END_POINT = "https://api.openweathermap.org/data/2.5/forecast?"
fileprivate enum QueryParameters: String {
    case apiKey = "appid"
    case lang
    case units
    case lon
    case lat
    
    func returnValue() -> String {
        switch self {
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

final class NetworkServiceImpl: NetworkService {
    
    let reachabilityManager = NetworkReachabilityManager()
    let cacher = ResponseCacher()
    
    public func loadWeatherForLocation(_ location: LocationData, completion: @escaping (Result<JSONWeatherData, WeatherError>) -> Void) {
        
        reachabilityManager?.startListening(onQueue: .global(), onUpdatePerforming: { status in
            switch status {
            case .notReachable:
                completion(.failure(.serverError("No internet... Please try later...")))
            case .unknown:
                print("enternet is in unknown status :0")
            case .reachable(_):
                print("enternet reachable :)")
            }
        })
        
        let parameters: [String: String] = [QueryParameters.apiKey.rawValue: QueryParameters.apiKey.returnValue(), QueryParameters.lang.rawValue: QueryParameters.lang.returnValue(), QueryParameters.units.rawValue: QueryParameters.units.returnValue(), QueryParameters.lon.rawValue: location.stringLong, QueryParameters.lat.rawValue: location.stringLatt]
        
        AF.request(END_POINT, parameters: parameters)
            .validate(statusCode: 200..<300)
            .cacheResponse(using: cacher)
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

