//
//  ForecastForDay.swift
//  WeatherApp
//
//  Created by Denis Sychev on 01.12.2021.
//

import Foundation

// MARK: - ForecastModel
// Model for RecenDayTableViewCell's
struct ForecastForDay: Hashable {
    var date: String = ""
    var minTemp: String = ""
    var maxTemp: String = ""
    var imageName: String = ""
    var forecastByHour: [HoursWeatherModel] = []
}

extension ForecastForDay {
    func averageTemp() -> String {
        let tempData: [Int] = self.forecastByHour.map{ Int($0.temp.dropLast()) ?? 0 }
        let tempSum = tempData.reduce(0){ $0 + $1 }
        return "\(Int(tempSum / tempData.count))°"
    }
    
    func minAverageTemp() -> String {
        return ""
    }
}

extension ForecastForDay: RecentDayHeaderData {
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
