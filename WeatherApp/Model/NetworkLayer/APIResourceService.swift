//
//  APIResourceService.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation


protocol ApiResource {
    
    var apiURL: String { get }
    var parameters: [String: String] { get set }
}

extension ApiResource {
    var url: URL? {
        guard let baseUrl = URL(string: apiURL) else { return nil }
        return baseUrl.appendingParameters(parameters)
    }
}

/*
    api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}
 */

struct WeatherResource: ApiResource {
    
    private enum Constants: String {
        case url = "https://api.openweathermap.org/data/2.5/forecast?"
        case apiKey = "08e77799ad87c75f8ae1192abab79639"
        // possible to use another enum with different languages
        case lang = "ru"
        case units = "metric"
    }
    
    internal var apiURL = Constants.url.rawValue
    
    var parameters: [String : String] = ["appid": Constants.apiKey.rawValue,
                                         "lang": Constants.lang.rawValue,
                                         "units": Constants.units.rawValue]
    
    mutating func addLocation(_ location: LocationData) {
        parameters.updateValue(location.stringLatt, forKey: "lat")
        parameters.updateValue(location.stringLong, forKey: "lon")
    }
}


