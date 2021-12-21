//
//  RecentDayCollection.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class RecentDayCollection: RecentDayCustomCollectionView {
    
    // MARK: - Properties
    private var diffableDataSource: UICollectionViewDiffableDataSource<Int, HoursWeatherModel>!
    
    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        super.init()
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        diffableDataSource = UICollectionViewDiffableDataSource<Int, HoursWeatherModel>(collectionView: self) {
            (collectionView: UICollectionView, indexPath: IndexPath, model: HoursWeatherModel) -> UICollectionViewCell? in
            collectionView.createHourWeatherCell(for: indexPath, with: model)
        }
        self.dataSource = diffableDataSource
    }

    public func configure(with forcast: [HoursWeatherModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, HoursWeatherModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(forcast, toSection: 0)
        diffableDataSource.apply(snapshot)
    }
}
