//
//  CityCollectionViewAdapter.swift
//  WeatherApp
//
//  Created by Denis Sychev on 14.12.2021.
//

import UIKit

class CitiesCollectionView: CitiesCustomCollectionView {
    // MARK: - Properties
    private var diffableDataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    // MARK: - Lifecycle
    required init(coder: NSCoder) {
        fatalError("init() has not been implemented")
    }
    
    required init() {
        super.init()
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        diffableDataSource = UICollectionViewDiffableDataSource<Int, String>.init(collectionView: self, cellProvider: { collectionView, indexPath, cityName in
            collectionView.createCityCell(for: indexPath, with: cityName)
        })
    }
    
    public func getCitiesData(_ data: [String]) {
        var snapShot = NSDiffableDataSourceSnapshot<Int, String>()
        snapShot.appendSections([0])
        snapShot.appendItems(data, toSection: 0)
        diffableDataSource.apply(snapShot)
    }
}
