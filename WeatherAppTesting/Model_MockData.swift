//
//  Model_MockData.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 09.12.2021.
//

import Foundation
@testable import WeatherApp

struct Model_MockData {
    static let jsonData = JSONWeatherData(list: [WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -2.08, feelsLike: -5.95, tempMin: -2.08, tempMax: -2.08, pressure: 1026, humidity: 75), wind: WeatherApp.Wind(speed: 2.95), dt: 1639483200.0, dtText: "2021-12-14 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -2.5, feelsLike: -6.39, tempMin: -3.35, tempMax: -2.5, pressure: 1026, humidity: 79), wind: WeatherApp.Wind(speed: 2.88), dt: 1639494000.0, dtText: "2021-12-14 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -3.46, feelsLike: -6.77, tempMin: -4.15, tempMax: -3.46, pressure: 1026, humidity: 87), wind: WeatherApp.Wind(speed: 2.21), dt: 1639504800.0, dtText: "2021-12-14 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "облачно с прояснениями", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -3.15, feelsLike: -6.07, tempMin: -3.15, tempMax: -3.15, pressure: 1025, humidity: 95), wind: WeatherApp.Wind(speed: 1.96), dt: 1639515600.0, dtText: "2021-12-14 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -2.22, feelsLike: -4.55, tempMin: -2.22, tempMax: -2.22, pressure: 1025, humidity: 96), wind: WeatherApp.Wind(speed: 1.66), dt: 1639526400.0, dtText: "2021-12-15 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -2.07, feelsLike: -4.1, tempMin: -2.07, tempMax: -2.07, pressure: 1024, humidity: 97), wind: WeatherApp.Wind(speed: 1.49), dt: 1639537200.0, dtText: "2021-12-15 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -1.64, feelsLike: -3.45, tempMin: -1.64, tempMax: -1.64, pressure: 1024, humidity: 96), wind: WeatherApp.Wind(speed: 1.4), dt: 1639548000.0, dtText: "2021-12-15 06:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: 0.19, feelsLike: -1.52, tempMin: 0.19, tempMax: 0.19, pressure: 1024, humidity: 87), wind: WeatherApp.Wind(speed: 1.49), dt: 1639558800.0, dtText: "2021-12-15 09:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "облачно с прояснениями", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -1.03, feelsLike: -1.03, tempMin: -1.03, tempMax: -1.03, pressure: 1024, humidity: 95), wind: WeatherApp.Wind(speed: 1.29), dt: 1639569600.0, dtText: "2021-12-15 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "облачно с прояснениями", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -3.12, feelsLike: -3.12, tempMin: -3.12, tempMax: -3.12, pressure: 1024, humidity: 97), wind: WeatherApp.Wind(speed: 1.15), dt: 1639580400.0, dtText: "2021-12-15 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "облачно с прояснениями", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -4.27, feelsLike: -6.49, tempMin: -4.27, tempMax: -4.27, pressure: 1024, humidity: 97), wind: WeatherApp.Wind(speed: 1.43), dt: 1639591200.0, dtText: "2021-12-15 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "небольшая облачность", icon: "02n")], main: WeatherApp.MainWeatherInfo(temp: -4.81, feelsLike: -8.2, tempMin: -4.81, tempMax: -4.81, pressure: 1024, humidity: 97), wind: WeatherApp.Wind(speed: 2.1), dt: 1639602000.0, dtText: "2021-12-15 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "переменная облачность", icon: "03n")], main: WeatherApp.MainWeatherInfo(temp: -3.23, feelsLike: -6.55, tempMin: -3.23, tempMax: -3.23, pressure: 1023, humidity: 93), wind: WeatherApp.Wind(speed: 2.25), dt: 1639612800.0, dtText: "2021-12-16 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -3.59, feelsLike: -7.64, tempMin: -3.59, tempMax: -3.59, pressure: 1022, humidity: 94), wind: WeatherApp.Wind(speed: 2.83), dt: 1639623600.0, dtText: "2021-12-16 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -2.36, feelsLike: -6.74, tempMin: -2.36, tempMax: -2.36, pressure: 1021, humidity: 92), wind: WeatherApp.Wind(speed: 3.45), dt: 1639634400.0, dtText: "2021-12-16 06:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -0.21, feelsLike: -5.29, tempMin: -0.21, tempMax: -0.21, pressure: 1019, humidity: 88), wind: WeatherApp.Wind(speed: 5.19), dt: 1639645200.0, dtText: "2021-12-16 09:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -0.07, feelsLike: -5.58, tempMin: -0.07, tempMax: -0.07, pressure: 1017, humidity: 87), wind: WeatherApp.Wind(speed: 6.08), dt: 1639656000.0, dtText: "2021-12-16 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 0.29, feelsLike: -4.98, tempMin: 0.29, tempMax: 0.29, pressure: 1015, humidity: 87), wind: WeatherApp.Wind(speed: 5.79), dt: 1639666800.0, dtText: "2021-12-16 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Rain", description: "небольшой дождь", icon: "10n")], main: WeatherApp.MainWeatherInfo(temp: 0.35, feelsLike: -4.47, tempMin: 0.35, tempMax: 0.35, pressure: 1014, humidity: 93), wind: WeatherApp.Wind(speed: 4.99), dt: 1639677600.0, dtText: "2021-12-16 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "небольшой снег", icon: "13n")], main: WeatherApp.MainWeatherInfo(temp: 0.19, feelsLike: -4.15, tempMin: 0.19, tempMax: 0.19, pressure: 1013, humidity: 98), wind: WeatherApp.Wind(speed: 4.15), dt: 1639688400.0, dtText: "2021-12-16 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "небольшой снег", icon: "13n")], main: WeatherApp.MainWeatherInfo(temp: 0.14, feelsLike: -3.51, tempMin: 0.14, tempMax: 0.14, pressure: 1011, humidity: 99), wind: WeatherApp.Wind(speed: 3.21), dt: 1639699200.0, dtText: "2021-12-17 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "снег", icon: "13n")], main: WeatherApp.MainWeatherInfo(temp: 0.16, feelsLike: -2.85, tempMin: 0.16, tempMax: 0.16, pressure: 1009, humidity: 99), wind: WeatherApp.Wind(speed: 2.52), dt: 1639710000.0, dtText: "2021-12-17 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "снег", icon: "13d")], main: WeatherApp.MainWeatherInfo(temp: 0.21, feelsLike: -3.09, tempMin: 0.21, tempMax: 0.21, pressure: 1009, humidity: 99), wind: WeatherApp.Wind(speed: 2.83), dt: 1639720800.0, dtText: "2021-12-17 06:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "небольшой снег", icon: "13d")], main: WeatherApp.MainWeatherInfo(temp: 0.45, feelsLike: -2.71, tempMin: 0.45, tempMax: 0.45, pressure: 1008, humidity: 100), wind: WeatherApp.Wind(speed: 2.73), dt: 1639731600.0, dtText: "2021-12-17 09:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "небольшой снег", icon: "13d")], main: WeatherApp.MainWeatherInfo(temp: 0.48, feelsLike: -2.34, tempMin: 0.48, tempMax: 0.48, pressure: 1008, humidity: 99), wind: WeatherApp.Wind(speed: 2.39), dt: 1639742400.0, dtText: "2021-12-17 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "небольшой снег", icon: "13n")], main: WeatherApp.MainWeatherInfo(temp: 0.48, feelsLike: -2.21, tempMin: 0.48, tempMax: 0.48, pressure: 1008, humidity: 99), wind: WeatherApp.Wind(speed: 2.27), dt: 1639753200.0, dtText: "2021-12-17 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 0.44, feelsLike: -2.22, tempMin: 0.44, tempMax: 0.44, pressure: 1009, humidity: 99), wind: WeatherApp.Wind(speed: 2.24), dt: 1639764000.0, dtText: "2021-12-17 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 0.22, feelsLike: -2.71, tempMin: 0.22, tempMax: 0.22, pressure: 1010, humidity: 98), wind: WeatherApp.Wind(speed: 2.45), dt: 1639774800.0, dtText: "2021-12-17 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: 0.07, feelsLike: -3.29, tempMin: 0.07, tempMax: 0.07, pressure: 1011, humidity: 98), wind: WeatherApp.Wind(speed: 2.86), dt: 1639785600.0, dtText: "2021-12-18 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "небольшой снег", icon: "13n")], main: WeatherApp.MainWeatherInfo(temp: -0.56, feelsLike: -5.02, tempMin: -0.56, tempMax: -0.56, pressure: 1013, humidity: 97), wind: WeatherApp.Wind(speed: 4.07), dt: 1639796400.0, dtText: "2021-12-18 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "небольшой снег", icon: "13d")], main: WeatherApp.MainWeatherInfo(temp: -1.61, feelsLike: -6.39, tempMin: -1.61, tempMax: -1.61, pressure: 1015, humidity: 95), wind: WeatherApp.Wind(speed: 4.18), dt: 1639807200.0, dtText: "2021-12-18 06:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -1.02, feelsLike: -6.14, tempMin: -1.02, tempMax: -1.02, pressure: 1016, humidity: 90), wind: WeatherApp.Wind(speed: 4.92), dt: 1639818000.0, dtText: "2021-12-18 09:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Snow", description: "небольшой снег", icon: "13d")], main: WeatherApp.MainWeatherInfo(temp: -1.73, feelsLike: -7.28, tempMin: -1.73, tempMax: -1.73, pressure: 1018, humidity: 90), wind: WeatherApp.Wind(speed: 5.33), dt: 1639828800.0, dtText: "2021-12-18 12:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -2.51, feelsLike: -8.02, tempMin: -2.51, tempMax: -2.51, pressure: 1019, humidity: 85), wind: WeatherApp.Wind(speed: 4.95), dt: 1639839600.0, dtText: "2021-12-18 15:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -2.78, feelsLike: -7.59, tempMin: -2.78, tempMax: -2.78, pressure: 1019, humidity: 88), wind: WeatherApp.Wind(speed: 3.86), dt: 1639850400.0, dtText: "2021-12-18 18:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -3.19, feelsLike: -7.36, tempMin: -3.19, tempMax: -3.19, pressure: 1019, humidity: 93), wind: WeatherApp.Wind(speed: 3.03), dt: 1639861200.0, dtText: "2021-12-18 21:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -4.36, feelsLike: -8.11, tempMin: -4.36, tempMax: -4.36, pressure: 1018, humidity: 94), wind: WeatherApp.Wind(speed: 2.44), dt: 1639872000.0, dtText: "2021-12-19 00:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04n")], main: WeatherApp.MainWeatherInfo(temp: -5.75, feelsLike: -9.47, tempMin: -5.75, tempMax: -5.75, pressure: 1016, humidity: 96), wind: WeatherApp.Wind(speed: 2.22), dt: 1639882800.0, dtText: "2021-12-19 03:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -6.97, feelsLike: -10.32, tempMin: -6.97, tempMax: -6.97, pressure: 1014, humidity: 97), wind: WeatherApp.Wind(speed: 1.84), dt: 1639893600.0, dtText: "2021-12-19 06:00:00"), WeatherApp.WeatherModel(weather: [WeatherApp.WeatherBrief(main: "Clouds", description: "пасмурно", icon: "04d")], main: WeatherApp.MainWeatherInfo(temp: -4.36, feelsLike: -10.09, tempMin: -4.36, tempMax: -4.36, pressure: 1010, humidity: 92), wind: WeatherApp.Wind(speed: 4.59), dt: 1639904400.0, dtText: "2021-12-19 09:00:00")], city: WeatherApp.City(name: "Тамбов", coord: WeatherApp.Coordinates(lat: 52.7211, lon: 41.4518)))
}
