//
//  TodayCellView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

class TodayCellView: UIView {
    
    private var backView = TodayCellBackgroundView()
    private var verticalStackView = TodayCellStackView()
    private var dataLabel = TodayCellLabel(withFont: AppFont.semiBold.size(14),
                                           andText: "Сегодя заебись")
    private var weatherImage = UIImageView(image: UIImage(named: "Sun"))
    private var degreeLabel = TodayCellLabel(withFont: AppFont.extraBold.size(48),
                                             andText: "25°")
    private var feelsLikeLabel = TodayCellLabel(withFont: AppFont.semiBold.size(14),
                                                andText: "Все ясно, по ощущениям весна!")

    // MARK: - LifeCycle
    required init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func configure(with data: TodayData) {
        dataLabel.text = data.data.convertedTimeToCurrentDay()
        degreeLabel.text = data.data.convertedTempreture()
        feelsLikeLabel.text = data.data.convertedFeelsLikeTemp()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        weatherImage.frame = CGRect(x: 0, y: 0, width: self.frame.width/5, height: self.frame.width/5)
        
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    private func setupViewHierarchy() {
        verticalStackView.addArrangedSubview(dataLabel)
        verticalStackView.addArrangedSubview(weatherImage)
        verticalStackView.addArrangedSubview(degreeLabel)
        verticalStackView.addArrangedSubview(feelsLikeLabel)
        backView.addSubview(verticalStackView)
        self.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        weatherImage.heightAnchor.constraint(equalToConstant: IMAGE_HEIGHT).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: IMAGE_HEIGHT).isActive = true
        backView.makeEqualConstraintsToView(self, withGap: GAP_TO_VIEW)
        verticalStackView.makeConstraintsToView(backView, top: TOP_MARGIN, bottom: BOTTOM_MARGIN, right: RIGHT_MARGIN, left: LEFT_MARGIN)
    }

    // MARK: - Constants
    private let TOP_MARGIN: CGFloat = 25
    private let BOTTOM_MARGIN: CGFloat = 25
    private let LEFT_MARGIN: CGFloat = 10
    private let RIGHT_MARGIN: CGFloat = 10
    private let GAP_TO_VIEW: CGFloat = 10
    private let IMAGE_HEIGHT: CGFloat = 150
    private let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    private let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
}