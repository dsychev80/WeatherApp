//
//  CurrentDayView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 30.11.2021.
//

import UIKit

class CurrentDayView: UIView {
    // MARK: - Constants
    
    struct Constants {
        static let topMargin: CGFloat = 25
        static let bottomMargin: CGFloat = 25
        static let leftMargin: CGFloat = 10
        static let rightMargin: CGFloat = 10
        static let gapToViews: CGFloat = 10
        static let imageHeight: CGFloat = 150
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
    }
    
    // MARK: - Properties
    private var backView: UIView = {
        let view = UIView()
        view.roundCorners()
        view.backgroundColor = UIColor(displayP3Red: 110/255, green: 170/255, blue: 249/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var dataLabel: UILabel = {
        let label = UILabel()
        label.makeTextWhite()
        label.font = AppFont.semiBold.size(14)
        // FIXME: Default data, need to delete after creating model.
        label.text = "Сегодня, 12 августа, чт"
        return label
    }()
    
    private var weatherImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Sun"))
        return imageView
    }()
    
    private var degreeLabel: UILabel = {
        let label = UILabel()
        label.makeTextWhite()
        label.font = AppFont.extraBold.size(48)
        // FIXME: Default data, need to delete after creating model.
        label.text = "30°"
        return label
    }()
    
    private var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.makeTextWhite()
        label.font = AppFont.semiBold.size(14)
        // FIXME: Default data, need to delete after creating model.
        label.text = "Ясно, ощущается как 32°"
        return label
    }()
    
    // MARK: - Life cycle
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewHierarchy()
        weatherImage.frame = CGRect(x: 0, y: 0, width: frame.width/5, height: frame.width/5)
        setupLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    // MARK: - Methods
    // Use this function to configure cell with data
    public func configure(with data: TodayData) {
        dataLabel.text = data.data.convertedTimeToCurrentDay()
        degreeLabel.text = data.data.convertedTempreture()
        feelsLikeLabel.text = data.data.convertedFeelsLikeTemp()
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
        self.widthAnchor.constraint(equalToConstant: Constants.screenWidth * 0.9).isActive = true
        self.heightAnchor.constraint(equalToConstant: Constants.screenHeight * 0.4).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: Constants.imageHeight).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: Constants.imageHeight).isActive = true
        backView.makeEqualConstraintsToView(self, withGap: Constants.gapToViews)
        verticalStackView.makeConstraintsToView(backView, top: Constants.topMargin, bottom: Constants.bottomMargin, right: Constants.rightMargin, left: Constants.leftMargin)
    }


}
