//
//  Item.swift
//  WeatherApp
//
//  Created by Denis Sychev on 08.12.2021.
//

import Foundation

enum Item: Hashable {
    case today(TodayData)
    case forecast(ForecastData)
}
