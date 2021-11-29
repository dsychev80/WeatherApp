//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import Foundation

/*
 {
    "coord":{
       "lon":41.4518,
       "lat":52.7211
    },
    "weather":[
       {
          "id":501,
          "main":"Rain",
          "description":"moderate rain",
          "icon":"10d"
       }
    ],
    "base":"stations",
    "main":{
       "temp":279.46,
       "feels_like":275.83,
       "temp_min":279.46,
       "temp_max":279.46,
       "pressure":1006,
       "humidity":95,
       "sea_level":1006,
       "grnd_level":991
    },
    "visibility":10000,
    "wind":{
       "speed":5.7,
       "deg":127,
       "gust":15.51
    },
    "rain":{
       "1h":1.15
    },
    "clouds":{
       "all":100
    },
    "dt":1638167637,
    "sys":{
       "country":"RU",
       "sunrise":1638162027,
       "sunset":1638191096
    },
    "timezone":10800,
    "id":484646,
    "name":"Tambov",
    "cod":200
 }
 */

struct WeatherModel: Decodable {
    let weather: [Weather]
    let main: WeatherInfo
    let visibility: Int
    let wind: Wind
    let dt: Int
    let name: String
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
//    let icon: String
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
