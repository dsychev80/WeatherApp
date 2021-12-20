//
//  CityCollectionViewAdapter.swift
//  WeatherApp
//
//  Created by Denis Sychev on 14.12.2021.
//

import Foundation
import UIKit

final class CityCollectionViewAdapter: NSObject {
    // MARK: - Properties
    private let collectionView: UICollectionView
    private var diffableDataSource: UICollectionViewDiffableDataSource<Int, String>!
    
    // MARK: - Lifecycle
    required init(with collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        
        setup()
    }

    // MARK: - Methods
    private func setup() {
        diffableDataSource = UICollectionViewDiffableDataSource<Int, String>.init(collectionView: collectionView, cellProvider: { collectionView, indexPath, cityName in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.name, for: indexPath) as! CityCollectionViewCell
            cell.configureWithCityName(cityName)
            return cell
        })
    }
    
    public func getCitiesData(_ data: [String]) {
        var snapShot = NSDiffableDataSourceSnapshot<Int, String>()
        snapShot.appendSections([0])
        snapShot.appendItems(data, toSection: 0)
        diffableDataSource.apply(snapShot)
    }
}
