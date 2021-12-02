//
//  CityCollectionViewCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 26.11.2021.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    private var backView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.CELL_BACKGROUND_COLOR
        view.clipsToBounds = true
        view.layer.cornerRadius = Constants.CORNER_RADIUS
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var cityLabel: WeatherCityNameLabel = {
        let label = WeatherCityNameLabel(withInsets: 4, left: 8, bottom: 4, right: 8)
        label.font = AppFont.medium.size(14)
        label.textColor = Constants.CITY_LABEL_TEXT_COLOR
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        autoresizesSubviews = true
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
    
    // MARK: - Methods
    public func configureCell(withData data: String) {
        cityLabel.text = data
    }
    
    private func setupViewHierarchy() {
        backView.addSubview(cityLabel)
        contentView.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        backView.makeEqualConstraintsToView(contentView)
        cityLabel.makeEqualConstraintsToView(backView)
        
    }
    
    // MARK: - Constants
    private struct Constants {
        static let CITY_LABEL_TEXT_COLOR = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
        static let CELL_BACKGROUND_COLOR = UIColor(displayP3Red: 243/255, green: 245/255, blue: 248/255, alpha: 1)
        static let CORNER_RADIUS: CGFloat = 8
    }
}
