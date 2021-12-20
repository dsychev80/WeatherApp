//
//  HourWeatherCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 24.11.2021.
//

import UIKit

class HourWeatherCell: UICollectionViewCell {
    
    // MARK: - Properties
    private var backView = HourCellView(withColor: UIColor(displayP3Red: 234/255, green: 236/255, blue: 239/255, alpha: 1))
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        setupViewHierarchy()
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(backView)
    }
    
    override func prepareForReuse() {
        backView.prepareForReuse()
    }
    
    public func configure(with data: HoursWeatherModel) {
        backView.configure(with: data)
    }
}

