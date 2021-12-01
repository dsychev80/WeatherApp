//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import Foundation
import UIKit


struct WeatherModel: Decodable {
    let weather: [Weather]
    let main: MainWeatherInfo
    let wind: Wind
    let dt: Double
    let dtText: String
    
    enum CodingKeys: String, CodingKey {
        case weather, main, wind, dt
        case dtText = "dt_txt"
    }
}

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


extension WeatherModel: CurrentDayWeatherData {
    
    func convertToHoursWeatherModel() -> HoursWeatherModel {
        var model = HoursWeatherModel()
        model.time = self.convertedHour()
        model.imageName = self.weather.first?.icon ?? "default"
        model.temp = self.main.temp.toDegreesInString()
        return model
    }

    func convertToForecastModel() -> ForecastData {
        var forcast = ForecastData()
        forcast.date = self.convertedTime()
        forcast.minTemp = self.main.tempMin.toDegreesInString()
        forcast.maxTemp = self.main.tempMax.toDegreesInString()
        forcast.imageName = self.weather.first?.icon ?? "default"
        return forcast
    }
    
    var data: WeatherModel {
        return self
    }
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct MainWeatherInfo: Decodable {
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

struct Wind: Decodable {
    let speed: Float
}

struct City: Decodable {
    let name: String
    let coord: Coordinates
}

struct Coordinates: Decodable {
    let lat: Float
    let lon: Float
}

