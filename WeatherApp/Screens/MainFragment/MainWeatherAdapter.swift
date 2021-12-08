//
//  MainWeatherAdapter.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit


class MainWeatherAdapter: NSObject {
    
    private var weather: JSONWeatherData?
    private var forecast: [ForecastData] = []
    
    override init() {
        super.init()
    }
    
    public func getForecast(_ forecast: JSONWeatherData) {
        self.weather = forecast
        self.forecast = forecast.convertToForecastByDay()
    }
}

extension MainWeatherAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let currentDayCell = TodayCell(style: .default, reuseIdentifier: TodayCell.name)
            guard let data = weather, let currentWeather = data.list.first else { return currentDayCell } // Returns cell without data
            currentDayCell.configure(with: currentWeather.convertToTodayData())
            return currentDayCell
        } else {
            let recentDayWeather = forecast[indexPath.row]
            let recentDayCell = RecentDayCell()
            recentDayCell.configure(with: recentDayWeather)
            return recentDayCell
        }
    }
}

