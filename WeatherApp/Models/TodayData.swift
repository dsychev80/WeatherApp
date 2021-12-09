//
//  TodayData.swift
//  WeatherApp
//
//  Created by Denis Sychev on 08.12.2021.
//

import Foundation

struct TodayData {
    let date: String
    let degree: String
    let feelsLike: String
}

extension TodayData: Hashable { }
