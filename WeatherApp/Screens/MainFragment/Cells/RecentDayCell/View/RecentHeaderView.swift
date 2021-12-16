//
//  RecentHeaderView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

fileprivate let DATA_LABEL_WIDTH: CGFloat = 130
fileprivate let DATA_LABEL_HEIGHT: CGFloat = 28.14
fileprivate let MIN_MAX_LABEL_WIDTH: CGFloat = 40
fileprivate let MIN_MAX_LABEL_HEIGHT: CGFloat = 28.14
fileprivate let WEATHER_IMAGE_HEIGHT: CGFloat = 24.12
fileprivate let WEATHER_IMAGE_WIDTH: CGFloat = 24

class RecentHeaderView: UIView {

    // MARK: - Properties
    private var dataLabel = WeatherCellLabel(withFont: R.font.manropeMedium(size: 16), fontColor: UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1))
    private var maxTempLabel = WeatherCellLabel(withFont: R.font.manropeExtraBold(size: 16), fontColor: UIColor(displayP3Red: 143/255, green: 150/255, blue: 161/255, alpha: 1))
    private var minTempLabel = WeatherCellLabel(withFont: R.font.manropeExtraBold(size: 16), fontColor: UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1))
    private var weatherImage = UIImageView(image: R.image.sun())
    
    // MARK: - LifeCycle
    required init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        minTempLabel.textAlignment = .right
        maxTempLabel.textAlignment = .right
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    public func configure(withData data: RecentDayHeaderData) {
        dataLabel.text = data.dayDate
        maxTempLabel.text = data.dayAverageTemp
        minTempLabel.text = data.dayMaxTemp
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
        
        dataLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left)
            make.width.equalTo(DATA_LABEL_WIDTH)
            make.centerY.equalTo(self.snp.centerY)
        }

        minTempLabel.snp.makeConstraints { make in
            make.width.equalTo(MIN_MAX_LABEL_WIDTH)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        maxTempLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(MIN_MAX_LABEL_WIDTH)
            make.left.equalTo(minTempLabel.snp.right).offset(8)
            make.right.equalTo(weatherImage.snp.left).offset(-16)
        }

        weatherImage.snp.makeConstraints { make in
            make.width.equalTo(WEATHER_IMAGE_WIDTH)
            make.height.equalTo(WEATHER_IMAGE_HEIGHT)
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right)
        }
    }
}

protocol RecentDayHeaderData {
    var dayDate: String { get }
    var dayAverageTemp: String { get }
    var dayMaxTemp: String { get }
}
