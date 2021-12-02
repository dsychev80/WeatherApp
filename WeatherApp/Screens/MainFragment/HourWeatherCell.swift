//
//  HourWeatherCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 24.11.2021.
//

import UIKit

class HourWeatherCell: UICollectionViewCell {
    
    private var backView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.backgroundColor
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var hourLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.medium.size(16)
        label.textColor = Constants.hourFontColor
        label.textAlignment = .center
        // FIXME: Default data, need to delete after creating model.
        label.text = "12:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var weatherImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Sun"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var tempLabel: UILabel = {
        let label = UILabel()
        label.font = AppFont.extraBold.size(16)
        label.textColor = Constants.tempFontColor
        label.textAlignment = .center
        // FIXME: Default data, need to delete after creating model.
        label.text = "25°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewHierarchy()
        setupLayoutConstraints()
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
    
    private func setupViewHierarchy() {
        backView.addSubview(hourLabel)
        backView.addSubview(weatherImage)
        backView.addSubview(tempLabel)
        contentView.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        backView.heightAnchor.constraint(equalToConstant: Content_Cell_Height).isActive = true
        backView.widthAnchor.constraint(equalToConstant: Content_Cell_Width).isActive = true
        
        
        hourLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        hourLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        
        weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        weatherImage.heightAnchor.constraint(equalToConstant: Image_Height).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: Image_Width).isActive = true
        
        tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
    }
    
    // MARK: - Constants
    struct Constants {
        static let backgroundColor = UIColor(displayP3Red: 234/255, green: 236/255, blue: 239/255, alpha: 1)
        static let hourFontColor = UIColor(displayP3Red: 143/255, green: 150/255, blue: 161/255, alpha: 1)
        static let tempFontColor = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
    }
    
    private let Content_Cell_Height: CGFloat = 114
    private let Content_Cell_Width: CGFloat = 73
    private let Temp_Label_Gap: CGFloat = 12
    private let Image_Width: CGFloat = 26
    private let Image_Height: CGFloat = 32
    
}

protocol HourData {
    var time: String { get }
    var temp: String { get }
    var imageName: String { get }
}
