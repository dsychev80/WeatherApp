//
//  Fonts.swift
//  WeatherApp
//
//  Created by Denis Sychev on 24.11.2021.
//

import Foundation
import UIKit

struct WeatherAppFont {
    static let manrope = "Manrope"
}

enum AppFont: String {
    case medium = "Medium"
    case semiBold = "SemiBold"
    case bold = "Bold"
    case extraBold = "ExtraBold"
    
    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: fullFontName, size: size + 1.0) {
            return font
        } else {
            fatalError("Font '\(fullFontName)' does not exist.")
        }
    }
    
    fileprivate var fullFontName: String {
        return WeatherAppFont.manrope + "-" + rawValue
    }
}
