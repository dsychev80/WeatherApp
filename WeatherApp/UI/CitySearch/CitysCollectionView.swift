//
//  CitysCollectionView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 06.12.2021.
//

import UIKit

class CitysCollectionView: UICollectionView {

    // MARK: - LifeCycle
    required init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        self.showsHorizontalScrollIndicator = false
        self.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: CityCollectionViewCell.name)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
    }
    

}
