//
//  TodayData.swift
//  WeatherApp
//
//  Created by Denis Sychev on 08.12.2021.
//

import Foundation

struct TodayData {
    let identifier = UUID()
    let date: String
    let degree: String
    let feelsLike: String
}

extension TodayData: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
    
    static func == (lhs: TodayData, rhs: TodayData) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
