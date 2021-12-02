//
//  JSONWeatherData.swift
//  WeatherApp
//
//  Created by Denis Sychev on 01.12.2021.
//

import Foundation

struct JSONWeatherData: Decodable {
    let list: [WeatherModel]
    let city: City
}

extension JSONWeatherData {

    func convertToForecastByDay() -> [ForecastData] {
        
        let formatter = DateFormatter()
        // "dt_txt":"2021-11-29 15:00:00"
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        
        var forcast: [ForecastData] = []
        var weatherBuffer = ForecastData()
        
        var currentDay: Int = 0
        self.list.forEach { weather in
            // get date from weather data
            if let date = formatter.date(from: weather.dtText) {
                // get day number from date
                let day = Int(dayFormatter.string(from: date)) ?? 0
                // compare days
                if currentDay == day {
                    // add to forecast by day
                    weatherBuffer.forecast.append(weather.convertToHoursWeatherModel())
                } else {
                    // add forecast to buffer
                    weatherBuffer.forecast.append(weather.convertToHoursWeatherModel())
                    forcast.append(weatherBuffer)
                    weatherBuffer = weather.convertToForecastModel()
                    currentDay = day
                }
            }
        }
        let _ = forcast.removeSubrange(0..<1)
        return forcast
    }
}
