//
//  WeatherAppErrors.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation


enum WeatherError: LocalizedError {
    case serverError(String)
    case clientError(String)
    case missingData
    case decodingError(String)
    case errorFromLocationServer(String)
    case missingLocation(String)
}
