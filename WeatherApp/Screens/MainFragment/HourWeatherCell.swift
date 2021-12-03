//
//  HourWeatherCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 24.11.2021.
//

import UIKit

class HourWeatherCell: UICollectionViewCell {
    
    private var backView = HourBackgroundView(withColor: UIColor(displayP3Red: 234/255,
                                                                 green: 236/255,
                                                                 blue: 239/255,
                                                                 alpha: 1))
    private var hourLabel = WeatherCellLabel(withFont: AppFont.medium.size(16),
                                             fontColor: HOUR_FONT_COLOR)
    private var weatherImage = UIImageView(image: UIImage(named: "Sun"))
    private var tempLabel = WeatherCellLabel(withFont: AppFont.extraBold.size(16),
                                             fontColor: TEMP_FONT_COLOR)
    
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
        hourLabel.text = data.time
        // FIXME: implement icon configuration
        tempLabel.text = data.temp
    }
    
    override func prepareForReuse() {
        hourLabel.text = ":"
        tempLabel.text = "-"
    }
    
    private func setup() {
        hourLabel.textAlignment = .center
        tempLabel.textAlignment = .center
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    private func setupViewHierarchy() {
        backView.addSubview(hourLabel)
        backView.addSubview(weatherImage)
        backView.addSubview(tempLabel)
        contentView.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        backView.heightAnchor.constraint(equalToConstant: CONTENT_CELL_HEIGHT).isActive = true
        backView.widthAnchor.constraint(equalToConstant: CONTENT_CELL_WIDTH).isActive = true
        
        
        hourLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        hourLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        
        weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        weatherImage.heightAnchor.constraint(equalToConstant: IMAGE_HEIGHT).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: IMAGE_WIDTH).isActive = true
        
        tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
    }
    
    // MARK: - Constants

    private static let HOUR_FONT_COLOR = UIColor(displayP3Red: 143/255,
                                                 green: 150/255,
                                                 blue: 161/255,
                                                 alpha: 1)
    private static let TEMP_FONT_COLOR = UIColor(displayP3Red: 42/255,
                                                 green: 45/255,
                                                 blue: 51/255,
                                                 alpha: 1)
    
    private let CONTENT_CELL_HEIGHT: CGFloat = 114
    private let CONTENT_CELL_WIDTH: CGFloat = 73
    private let TEMP_LABEL_GAP: CGFloat = 12
    private let IMAGE_WIDTH: CGFloat = 26
    private let IMAGE_HEIGHT: CGFloat = 32
    
}

protocol HourData {
    var time: String { get }
    var temp: String { get }
    var imageName: String { get }
}
