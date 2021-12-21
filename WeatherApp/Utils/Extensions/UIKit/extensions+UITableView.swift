//
//  extensions+UITableView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 21.12.2021.
//

import UIKit

extension UITableView {
    func createWeatherDayCell(for indexPath: IndexPath, with item: Item) -> UITableViewCell {
        switch item {
        case .today(let todayData):
            let cell = self.dequeueReusableCell(withIdentifier: TodayCell.name, for: indexPath) as! TodayCell
            cell.configure(with: todayData)
            return cell
        case .forecast(let forecastData):
            let cell = self.dequeueReusableCell(withIdentifier: RecentDayCell.name, for: indexPath) as! RecentDayCell
            cell.configure(with: forecastData)
            return cell
        }
    }
}
