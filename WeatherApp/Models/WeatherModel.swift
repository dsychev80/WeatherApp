//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import Foundation
import UIKit

// MARK: - WeatherModel
struct WeatherModel: Decodable, Equatable, Hashable {
    let weather: [WeatherBrief]
    let main: MainWeatherInfo
    let wind: Wind
    let dt: Double
    let dtText: String
    
    enum CodingKeys: String, CodingKey {
        case weather, main, wind, dt
        case dtText = "dt_txt"
    }
}

// MARK: - convertation functions
extension WeatherModel {
    
    public func convertedTime() -> String {
        let todayDate = Date(timeIntervalSince1970: self.dt)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM EEEEEE"
        formatter.locale = Locale(identifier: "ru_RU")
        
        let formattedDate = formatter.string(from: todayDate)
        let dateComponents = formattedDate.components(separatedBy: " ")
        let convertedDate = "\(dateComponents[0]) \(dateComponents[1]), \(dateComponents[2].lowercased())"
        
        return convertedDate
    }
    
    public func convertedTimeToCurrentDay() -> String {
        return "Сегодня, \(convertedTime())"
    }
    
    public func convertedHour() -> String {        
        let components = self.dtText.components(separatedBy: " ")
        let time = components[1]
        let hoursAndMins = time.components(separatedBy: ":")
        
        return "\(hoursAndMins[0]):\(hoursAndMins[1])"
    }
    
    public func convertedTempreture() -> String {
        return "\(Int(self.main.temp))°"
    }
    
    public func convertedFeelsLikeTemp() -> String {
        let feelsLike =  ", ощущается как "
        if var weather = self.weather.first?.description {
            weather = weather.prefix(1).uppercased() + weather.dropFirst()
            return weather + feelsLike + String(Int(self.main.feelsLike)) + "°"
        } else {
            return "Ощущается как \(Int(self.main.feelsLike).toDegreesInString())"
        }
    }
}

// MARK: - : TodayData
extension WeatherModel {
    
    func convertToHoursWeatherModel() -> HoursWeatherModel {
        var model = HoursWeatherModel()
        model.time = self.convertedHour()
        model.imageName = self.weather.first?.icon ?? "default"
        model.temp = self.main.temp.toDegreesInString()
        return model
    }

    func convertToForecastModel() -> ForecastForDay {
        var forcast = ForecastForDay()
        forcast.date = self.convertedTime()
        forcast.minTemp = self.main.tempMin.toDegreesInString()
        forcast.maxTemp = self.main.tempMax.toDegreesInString()
        forcast.imageName = self.weather.first?.icon ?? "default"
        return forcast
    }
    
    func convertToTodayData() -> TodayData {
        let convertData = TodayData(date: self.convertedTimeToCurrentDay(),
                                    degree: self.convertedTempreture(),
                                    feelsLike: self.convertedFeelsLikeTemp())
        return convertData
    }
}

// MARK: - WeatherBrief
struct WeatherBrief: Decodable, Equatable, Hashable {
    let main: String
    let description: String
    let icon: String
}

// MARK: - MainWeatherInfo
struct MainWeatherInfo: Decodable, Equatable, Hashable {
    let temp: Float
    let feelsLike: Float
    let tempMin: Float
    let tempMax: Float
    let pressure: Int
    let humidity: Int
    
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

// MARK: - Wind
struct Wind: Decodable, Equatable, Hashable {
    let speed: Float
}

// MARK: - City
struct City: Decodable, Equatable, Hashable {
    let name: String
    let coord: Coordinates
}

// MARK: - Coordinates
struct Coordinates: Decodable, Equatable, Hashable {
    let lat: Float
    let lon: Float
}

