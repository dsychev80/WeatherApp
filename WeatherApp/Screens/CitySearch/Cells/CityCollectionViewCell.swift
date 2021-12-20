//
//  CityCollectionViewCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 26.11.2021.
//

import UIKit

// MARK: - Constants
fileprivate let CORNER_RADIUS: CGFloat = 8
fileprivate let CITY_LABEL_TEXT_COLOR = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
fileprivate let CELL_BACKGROUND_COLOR = UIColor(displayP3Red: 243/255, green: 245/255, blue: 248/255, alpha: 1)

class CityCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    private var backView: UIView = {
        let view = UIView()
        view.backgroundColor = CELL_BACKGROUND_COLOR
        view.clipsToBounds = true
        view.layer.cornerRadius = CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var cityLabel: WeatherCityNameLabel = {
        let label = WeatherCityNameLabel(withInsets: 4, left: 8, bottom: 4, right: 8)
        label.font = R.font.manropeMedium(size: 14)
        label.textColor = CITY_LABEL_TEXT_COLOR
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        autoresizesSubviews = true
        setupLayout()
    }
    
    // MARK: - Methods
    
    private func setupLayout() {
        contentView.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        backView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    
    public func configureWithCityName(_ name: String) {
        cityLabel.text = name
    }
}
