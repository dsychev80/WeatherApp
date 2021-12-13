//
//  Forecast.swift
//  WeatherApp
//
//  Created by Denis Sychev on 01.12.2021.
//

import Foundation

// MARK: - ForecastModel
// Model for RecenDayTableViewCell's
struct ForecastData: Hashable {
    var date: String = ""
    var minTemp: String = ""
    var maxTemp: String = ""
    var imageName: String = ""
    var forecast: [HoursWeatherModel] = []
}

extension ForecastData {
    func averageTemp() -> String {
        let tempData: [Int] = self.forecast.map{ Int($0.temp.dropLast()) ?? 0 }
        let tempSum = tempData.reduce(0){ $0 + $1 }
        return "\(Int(tempSum / tempData.count))°"
    }
    
    func minAverageTemp() -> String {
        return ""
    }
}

extension ForecastData: RecentDayHeaderData {
    var dayDate: String {
        return date
    }

    var dayAverageTemp: String {
        return minTemp
    }

    var dayMaxTemp: String {
        return maxTemp
    }
}
