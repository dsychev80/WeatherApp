//
//  RecentDayCollectionAdapter.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class RecentDayCollectionAdapter: NSObject {
    
    // MARK: - Properties
    private var forecast: [HoursWeatherModel] = []
    
    // MARK: - LifeCycle
    override init() {
        super.init()
    }
    
    // MARK: - Methods
    public func getForcastData(_ data: [HoursWeatherModel]) {
        self.forecast = data
    }
}

extension RecentDayCollectionAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourWeatherCell.name, for: indexPath) as! HourWeatherCell
        cell.configure(with: forecast[indexPath.row])
        DispatchQueue.main.async {
            collectionView.reloadData()
        }
        return cell
    }
}
