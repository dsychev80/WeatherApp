//
//  HourCellView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class HourCellView: UIView {
    
    // MARK: - Properties
    private var hourLabel = WeatherCellLabel(withFont: AppFont.medium.size(16),
                                             fontColor: HOUR_FONT_COLOR)
    private var weatherImage = UIImageView(image: UIImage(named: "Sun"))
    private var tempLabel = WeatherCellLabel(withFont: AppFont.extraBold.size(16),
                                             fontColor: TEMP_FONT_COLOR)

    // MARK: - LifeCycle
    required init(withColor color: UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = color
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        self.layer.cornerRadius = CORNER_RADIUS
        self.translatesAutoresizingMaskIntoConstraints = false
        
        hourLabel.textAlignment = .center
        tempLabel.textAlignment = .center
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    public func configure(with data: HoursWeatherModel) {
        hourLabel.text = data.time
        // FIXME: implement icon configuration
        tempLabel.text = data.temp
    }
    
    public func prepareForReuse() {
        hourLabel.text = ":"
        tempLabel.text = "-"
    }
    
    private func setupViewHierarchy() {
        self.addSubview(hourLabel)
        self.addSubview(weatherImage)
        self.addSubview(tempLabel)
    }
    
    private func setupLayoutConstraints() {
        self.heightAnchor.constraint(equalToConstant: CONTENT_CELL_HEIGHT).isActive = true
        self.widthAnchor.constraint(equalToConstant: CONTENT_CELL_WIDTH).isActive = true
        
        
        hourLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hourLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        
        weatherImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        weatherImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        weatherImage.heightAnchor.constraint(equalToConstant: IMAGE_HEIGHT).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: IMAGE_WIDTH).isActive = true
        
        tempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tempLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
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
    
    private let CORNER_RADIUS: CGFloat = 16
}
