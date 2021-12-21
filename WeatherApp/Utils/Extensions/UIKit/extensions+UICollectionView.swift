//
//  extensions+UICollectionView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 21.12.2021.
//

import UIKit

extension UICollectionView {
    func createHourWeatherCell(for indexPath: IndexPath, with data: HoursWeatherModel) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: HourWeatherCell.name, for: indexPath) as! HourWeatherCell
        cell.configure(with: data)
        return cell
    }
    
    func createCityCell(for indexPath: IndexPath, with cityName: String) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.name, for: indexPath) as! CityCollectionViewCell
        cell.configureWithCityName(cityName)
        return cell
    }
}
