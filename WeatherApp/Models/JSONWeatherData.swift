//
//  JSONWeatherData.swift
//  WeatherApp
//
//  Created by Denis Sychev on 01.12.2021.
//

import Foundation

struct JSONWeatherData: Decodable, Equatable, Hashable {
    let list: [WeatherModel]
    let city: City
}

extension JSONWeatherData {
    
    public func returnTodayWeather() -> TodayData? {
        guard let weatherModel = self.list.first else {
            print("guard condition not met at: \(#file) \(#line) \(#function)")
            return nil
        }
        return weatherModel.convertToTodayData()
    }

    public func convertToForecastByDay() -> [ForecastForDay] {
        let formatter = DateFormatter()
        // "dt_txt":"2021-11-29 15:00:00"
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        
        var forcast: [ForecastForDay] = []
        var weatherBuffer = ForecastForDay()
        
        var currentDay: Int = 0
        self.list.forEach { weather in
            // get date from weather data
            if let date = formatter.date(from: weather.dtText) {
                // get day number from date
                let day = Int(dayFormatter.string(from: date)) ?? 0
                // compare days
                if currentDay == day {
                    // add to forecast by day
                    weatherBuffer.forecastByHour.append(weather.convertToHoursWeatherModel())
                } else {
                    // add forecast to buffer
                    weatherBuffer.forecastByHour.append(weather.convertToHoursWeatherModel())
                    forcast.append(weatherBuffer)
                    weatherBuffer = weather.convertToForecastModel()
                    currentDay = day
                }
            }
        }
        let _ = forcast.removeSubrange(0..<1)
        return forcast
    }
    
    public func convertToItems() -> [Item] {
        guard  let todayWeather = self.returnTodayWeather() else {
            print("guard condition not met at: \(#file) \(#line) \(#function)")
            return []
        }
        let dayWeatherItem = Item.today(todayWeather)
        var items = self.convertToForecastByDay()
            .map { Item.forecast($0) }
        items.remove(at: 0)
        items.insert(dayWeatherItem, at: 0)
        return items
    }
}
