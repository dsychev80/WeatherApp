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
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
    
    // MARK: - Methods
    // Use this function to configure cell with data
    public func configure(with data: HoursWeatherModel) {
        backView.configure(with: data)
    }
    
    override func prepareForReuse() {
        backView.prepareForReuse()
    }
    
    private func setup() {
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        backView.snp.makeConstraints { make in
            make.height.equalTo(CONTENT_CELL_HEIGHT)
        }
        backView.snp.makeConstraints { make in
            make.width.equalTo(CONTENT_CELL_WIDTH)
        }
    }
    
    // MARK: - Constants
    
    private let CONTENT_CELL_HEIGHT: CGFloat = 114
    private let CONTENT_CELL_WIDTH: CGFloat = 73
}

protocol HourData {
    var time: String { get }
    var temp: String { get }
    var imageName: String { get }
}
