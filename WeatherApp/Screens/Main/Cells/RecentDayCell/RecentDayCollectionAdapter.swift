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
        
        setup()
    }

    // MARK: - Methods
    private func setup() {
        diffableDataSource = UICollectionViewDiffableDataSource<Int, HoursWeatherModel>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, model: HoursWeatherModel) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourWeatherCell.name, for: indexPath) as! HourWeatherCell
            cell.configure(with: model)
                return cell
        }
        collectionView.dataSource = diffableDataSource
    }

    public func configure(with forcast: [HoursWeatherModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, HoursWeatherModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(forcast, toSection: 0)
        diffableDataSource.apply(snapshot)
    }
}
