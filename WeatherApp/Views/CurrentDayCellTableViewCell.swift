//
//  CurrentDayCellTableViewCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 23.11.2021.
//

import UIKit

protocol CurrentDayWeatherData {
    var data: WeatherModel { get }
    var colorStyle: ColorScheme { get }
}

enum ColorScheme {
    case dark
    case light
}

final class CurrentDayCellTableViewCell: UITableViewCell {
    // MARK: - Constants
    
    struct Constants {
        static let topMargin: CGFloat = 25
        static let bottomMargin: CGFloat = 25
        static let leftMargin: CGFloat = 10
        static let rightMargin: CGFloat = 10
        static let gapToViews: CGFloat = 10
        static let imageHeight: CGFloat = 150
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
        // FIXME: Default data, need to delete after creating model.
        label.text = "Сегодня, 23 ноября, Вт"
        return label
    }()
    
    private var weatherImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Sun"))
        return imageView
    }()
    
    private var degreeLabel: UILabel = {
        let label = UILabel()
        label.makeTextWhite()
        label.font = UIFont(name: "Cochin-Bold", size: 50)
        // FIXME: Default data, need to delete after creating model.
        label.text = "30°"
        return label
    }()
    
    private var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.makeTextWhite()
        // FIXME: Default data, need to delete after creating model.
        label.text = "Ясно, ощущается как 32°"
        return label
    }()
    
    // MARK: - Life cycle
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewHierarchy()
        weatherImage.frame = CGRect(x: 0, y: 0, width: contentView.frame.width/5, height: contentView.frame.width/5)
        setupLayoutConstraints()
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    // MARK: - Methods
    // Use this function to configure cell with data
    public func configure(with data: CurrentDayWeatherData) {
        
    }
    
    private func setupViewHierarchy() {
        verticalStackView.addArrangedSubview(dataLabel)
        verticalStackView.addArrangedSubview(weatherImage)
        verticalStackView.addArrangedSubview(degreeLabel)
        verticalStackView.addArrangedSubview(feelsLikeLabel)
        backView.addSubview(verticalStackView)
        contentView.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        weatherImage.heightAnchor.constraint(equalToConstant: Constants.imageHeight).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: Constants.imageHeight).isActive = true
        backView.makeEqualConstraintsToView(contentView, withGap: Constants.gapToViews)
        verticalStackView.makeConstraintsToView(backView, top: Constants.topMargin, bottom: Constants.bottomMargin, right: Constants.rightMargin, left: Constants.leftMargin)
    }

}

