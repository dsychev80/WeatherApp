//
//  Location.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import Foundation

struct LocationData: Equatable {
    let longitude: Double
    let lattitude: Double
}

extension LocationData {
    var stringLong: String {
        return String(longitude)
    }
    
    var stringLatt: String {
        return String(lattitude)
    }
}
