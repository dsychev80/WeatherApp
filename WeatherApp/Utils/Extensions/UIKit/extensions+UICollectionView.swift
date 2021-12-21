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
}
