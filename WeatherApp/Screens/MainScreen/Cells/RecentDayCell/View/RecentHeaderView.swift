//
//  RecentHeaderView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

fileprivate let DATA_LABEL_TEXT_COLOR = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
fileprivate let DATA_LABEL_WIDTH: CGFloat = 130
fileprivate let DATA_LABEL_HEIGHT: CGFloat = 28.14

fileprivate let MAX_TEMP_LABEL_TEXT_COLOR = UIColor(displayP3Red: 143/255, green: 150/255, blue: 161/255, alpha: 1)
fileprivate let MIN_MAX_LABEL_WIDTH: CGFloat = 40
fileprivate let MIN_MAX_LABEL_HEIGHT: CGFloat = 28.14
fileprivate let WEATHER_IMAGE_HEIGHT: CGFloat = 24.12
fileprivate let WEATHER_IMAGE_WIDTH: CGFloat = 24


class RecentHeaderView: UIView {

    // MARK: - Properties
    private var dataLabel = WeatherCellLabel()
    private var maxTempLabel = WeatherCellLabel()
    private var minTempLabel = WeatherCellLabel()
    private var weatherImage = UIImageView(image: R.image.sun())
    
    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        setupStyle()
        setupLayout()
    }
    
    fileprivate func setupStyle() {
        minTempLabel.textAlignment = .right
        maxTempLabel.textAlignment = .right
        
        dataLabel.configurate(with: R.font.manropeMedium(size: 16), textColor: DATA_LABEL_TEXT_COLOR)
        maxTempLabel.configurate(with: R.font.manropeExtraBold(size: 16), textColor: MAX_TEMP_LABEL_TEXT_COLOR)
        minTempLabel.configurate(with: R.font.manropeExtraBold(size: 16), textColor: DATA_LABEL_TEXT_COLOR)
    }

    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(dataLabel)
        dataLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.width.equalTo(DATA_LABEL_WIDTH)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        self.addSubview(minTempLabel)
        minTempLabel.snp.makeConstraints { make in
            make.width.equalTo(MIN_MAX_LABEL_WIDTH)
            make.centerY.equalTo(self.snp.centerY)
        }
        

        self.addSubview(weatherImage)
        weatherImage.snp.makeConstraints { make in
            make.width.equalTo(WEATHER_IMAGE_WIDTH)
            make.height.equalTo(WEATHER_IMAGE_HEIGHT)
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right)
        }

        self.addSubview(maxTempLabel)
        maxTempLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(MIN_MAX_LABEL_WIDTH)
            make.left.equalTo(minTempLabel.snp.right).offset(8)
            make.right.equalTo(weatherImage.snp.left).offset(-16)
        }
    }
    
    public func configure(with data: RecentDayHeaderData) {
        dataLabel.text = data.dayDate
        maxTempLabel.text = data.dayAverageTemp
        minTempLabel.text = data.dayMaxTemp
    }
}

// MARK: - RecentDayHeaderData protocol
protocol RecentDayHeaderData {
    var dayDate: String { get }
    var dayAverageTemp: String { get }
    var dayMaxTemp: String { get }
}
