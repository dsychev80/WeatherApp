//
//  RecentDayCustomCollectionView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class RecentDayCustomCollectionView: UICollectionView {

    // MARK: - Properties
    private let layout = UICollectionViewFlowLayout()
    
    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        super.init(frame: .zero, collectionViewLayout: self.layout)
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 73, height: 114)

        self.collectionViewLayout = layout
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.register(HourWeatherCell.self, forCellWithReuseIdentifier: HourWeatherCell.name)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
    }
}
