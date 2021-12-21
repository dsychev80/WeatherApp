//
//  TodayCellView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit
import SnapKit

// MARK: - Constants
fileprivate let DEGREE_HEIGHT: CGFloat = 52
fileprivate let LABEL_HEIGHT: CGFloat = 24
fileprivate let TOP_MARGIN: CGFloat = 25
fileprivate let BOTTOM_MARGIN: CGFloat = 25
fileprivate let LEFT_MARGIN: CGFloat = 10
fileprivate let RIGHT_MARGIN: CGFloat = 10
fileprivate let GAP_TO_VIEW: CGFloat = 10
fileprivate let IMAGE_HEIGHT: CGFloat = 150

class TodayCellView: UIView {
    // MARK: - Properties
    private var backView = TodayCellBackgroundView()
    private var verticalStackView = TodayCellStackView()
    private var dataLabel = WeatherCellLabel(withFont: R.font.manropeSemiBold(size: 14), fontColor: .white)
    private var weatherImage = UIImageView(image: R.image.sun())
    private var degreeLabel = WeatherCellLabel(withFont: R.font.manropeBold(size: 48), fontColor: .white)
    private var feelsLikeLabel = WeatherCellLabel(withFont: R.font.manropeSemiBold(size: 14), fontColor: .white)

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
        translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
    }
    
    private func setupLayout() {
        verticalStackView.addArrangedSubview(dataLabel)
        dataLabel.snp.makeConstraints { make in
            make.height.equalTo(LABEL_HEIGHT)
        }
        
        verticalStackView.addArrangedSubview(weatherImage)
        weatherImage.snp.makeConstraints { make in
            make.height.equalTo(IMAGE_HEIGHT)
            make.width.equalTo(IMAGE_HEIGHT)
        }
        
        verticalStackView.addArrangedSubview(degreeLabel)
        degreeLabel.snp.makeConstraints { make in
            make.height.equalTo(DEGREE_HEIGHT)
        }
        
        verticalStackView.addArrangedSubview(feelsLikeLabel)
        feelsLikeLabel.snp.makeConstraints { make in
            make.height.equalTo(LABEL_HEIGHT)
        }
        
        self.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: GAP_TO_VIEW, left: GAP_TO_VIEW, bottom: GAP_TO_VIEW, right: GAP_TO_VIEW))
        }
        
        backView.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: TOP_MARGIN, left: LEFT_MARGIN, bottom: BOTTOM_MARGIN, right: RIGHT_MARGIN))
        }
    }
    
    public func configure(with data: TodayData) {
        dataLabel.text = data.date
        degreeLabel.text = data.degree
        feelsLikeLabel.text = data.feelsLike
    }
}
