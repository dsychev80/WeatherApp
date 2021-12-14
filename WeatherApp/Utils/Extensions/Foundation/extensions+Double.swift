//
//  extensions+Double.swift
//  WeatherApp
//
//  Created by Denis Sychev on 13.12.2021.
//

import Foundation

extension Double {
    func toDegreesInString() -> String {
        return "\(Int(self))°"
    }
}
