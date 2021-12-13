//
//  RecentDayCollectionAdapter.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class RecentDayCollectionAdapter: NSObject {
    
    // MARK: - Properties
    private let collectionView: UICollectionView!
    private var diffableDataSource: UICollectionViewDiffableDataSource<Int, HoursWeatherModel>!
    
    // MARK: - LifeCycle
    required init(with collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        
        diffableDataSource = UICollectionViewDiffableDataSource<Int, HoursWeatherModel>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, model: HoursWeatherModel) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourWeatherCell.name, for: indexPath) as! HourWeatherCell
            cell.configure(with: model)
                return cell
        }
        collectionView.dataSource = diffableDataSource
    }
    
    // MARK: - Methods
    public func getForcastData(_ data: [HoursWeatherModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, HoursWeatherModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        diffableDataSource.apply(snapshot)
    }
}
