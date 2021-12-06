//
//  RecentHeaderView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class RecentHeaderView: UIView {

    // MARK: - Properties
    private var dataLabel = WeatherCellLabel(withFont: AppFont.medium.size(16), fontColor: UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1))
    private var maxTempLabel = WeatherCellLabel(withFont: AppFont.extraBold.size(16), fontColor: UIColor(displayP3Red: 143/255, green: 150/255, blue: 161/255, alpha: 1))
    private var minTempLabel = WeatherCellLabel(withFont: AppFont.extraBold.size(16), fontColor: UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1))
    private var weatherImage = UIImageView(image: UIImage(named: "Sun"))
    
    // MARK: - LifeCycle
    required init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func configure(withData data: RecentDayHeaderData) {
        dataLabel.text = data.dayDate
        maxTempLabel.text = data.dayAverageTemp
        minTempLabel.text = data.dayMaxTemp
    }
    
    private func setup() {
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    private func setupViewHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(dataLabel)
        self.addSubview(minTempLabel)
        self.addSubview(maxTempLabel)
        self.addSubview(weatherImage)
    }
    
    private func setupLayoutConstraints() {
        
        for view in self.subviews {
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        }
        
        dataLabel.widthAnchor.constraint(equalToConstant: DATA_LABEL_WIDTH).isActive = true
        minTempLabel.widthAnchor.constraint(equalToConstant: MIN_MAX_LABEL_WIDTH).isActive = true
        maxTempLabel.widthAnchor.constraint(equalToConstant: MIN_MAX_LABEL_WIDTH).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: WEATHER_IMAGE_WIDTH).isActive = true
        
        dataLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        maxTempLabel.leftAnchor.constraint(equalTo: minTempLabel.rightAnchor, constant: 8).isActive = true
        maxTempLabel.rightAnchor.constraint(equalTo: weatherImage.leftAnchor, constant: -16).isActive = true
        weatherImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: WEATHER_IMAGE_HEIGHT).isActive = true
    }
    
    private let DATA_LABEL_WIDTH: CGFloat = 115
    private let DATA_LABEL_HEIGHT: CGFloat = 28.14
    private let MIN_MAX_LABEL_WIDTH: CGFloat = 32
    private let MIN_MAX_LABEL_HEIGHT: CGFloat = 28.14
    private let WEATHER_IMAGE_HEIGHT: CGFloat = 24.12
    private let WEATHER_IMAGE_WIDTH: CGFloat = 30
}
