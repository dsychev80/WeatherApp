//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import Foundation
import UIKit


struct WeatherData: Decodable {
    let list: [WeatherModel]
    let city: City
}

extension WeatherData {

    func convertToForecastByDay() -> [ForecastModel] {
        
        let formatter = DateFormatter()
        // "dt_txt":"2021-11-29 15:00:00"
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        
        var forcast: [ForecastModel] = []
        var weatherBuffer = ForecastModel()
        
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
                    print(weather.dtText)
                    currentDay = day
                }
            }
        }
        let _ = forcast.removeSubrange(0..<1)
        return forcast
    }
}

struct WeatherModel: Decodable {
    let weather: [Weather]
    let main: WeatherInfo
    let wind: Wind
    let dt: Double
    let dtText: String
    
    enum CodingKeys: String, CodingKey {
        case weather, main, wind, dt
        case dtText = "dt_txt"
    }
    
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: self.dtText) else { return "-"}
        let calendar = Calendar(identifier: .gregorian)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        return "\(hour):\(minute)"
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

    func convertToForecastModel() -> ForecastModel {
        var forcast = ForecastModel()
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

struct WeatherInfo: Decodable {
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

// MARK: - ForecastModel
// Model for RecenDayTableViewCell's
struct ForecastModel {
    var date: String = ""
    var minTemp: String = ""
    var maxTemp: String = ""
    var imageName: String = ""
    var forecast: [HoursWeatherModel] = []
}

struct HoursWeatherModel: HourWeatherData {
    var time: String = ""
    var imageName: String = ""
    var temp: String = ""
}
