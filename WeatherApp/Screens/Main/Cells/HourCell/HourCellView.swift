//
//  HourCellView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

// MARK: - Constants
fileprivate let CONTENT_CELL_HEIGHT: CGFloat = 114
fileprivate let CONTENT_CELL_WIDTH: CGFloat = 73
fileprivate let LABEL_GAP: CGFloat = 12
fileprivate let IMAGE_WIDTH: CGFloat = 32
fileprivate let IMAGE_HEIGHT: CGFloat = 32
fileprivate let CORNER_RADIUS: CGFloat = 16
fileprivate let HOUR_FONT_COLOR = UIColor(displayP3Red: 143/255,
                                          green: 150/255,
                                          blue: 161/255,
                                          alpha: 1)
fileprivate let TEMP_FONT_COLOR = UIColor(displayP3Red: 42/255,
                                          green: 45/255,
                                          blue: 51/255,
                                          alpha: 1)

class HourCellView: UIView {
    // MARK: - Properties
    private var hourLabel = WeatherCellLabel(withFont: R.font.manropeMedium(size: 16),
                                             fontColor: HOUR_FONT_COLOR)
    private var weatherImage = UIImageView(image: R.image.sun())
    private var tempLabel = WeatherCellLabel(withFont: R.font.manropeExtraBold(size: 16),
                                             fontColor: TEMP_FONT_COLOR)

    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(withColor color: UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = color
        setup()
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
    
    private func setupViewHierarchy() {
        self.addSubview(hourLabel)
        self.addSubview(weatherImage)
        self.addSubview(tempLabel)
    }
    
    private func setupLayoutConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(CONTENT_CELL_HEIGHT)
            make.width.equalTo(CONTENT_CELL_WIDTH)
        }

        hourLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(LABEL_GAP)
        }

        weatherImage.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(IMAGE_HEIGHT)
            make.width.equalTo(IMAGE_WIDTH)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).offset(-LABEL_GAP)
        }
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
}
