//
//  CityCollectionViewCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 26.11.2021.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    private struct Constants {
        static let cityLabelTextColor = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
        static let cellBackgroundColor = UIColor(displayP3Red: 243/255, green: 245/255, blue: 248/255, alpha: 1)
    }
    
    private var cityLabel: UILabel = {
        let label = UILabel()
        
        label.font = AppFont.medium.size(14)
        label.textColor = Constants.cityLabelTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)

        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = Constants.cellBackgroundColor
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 30
        contentView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

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
        contentView.addSubview(cityLabel)
    }
    
    private func setupLayoutConstraints() {
        cityLabel.makeEqualConstraintsToView(contentView)
    }
}
