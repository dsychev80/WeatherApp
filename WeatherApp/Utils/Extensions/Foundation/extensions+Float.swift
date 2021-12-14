//
//  extensions+Float.swift
//  WeatherApp
//
//  Created by Denis Sychev on 13.12.2021.
//

import Foundation

extension Float {
    func toDegreesInString() -> String {
        return "\(Int(self))°"
    }
}
