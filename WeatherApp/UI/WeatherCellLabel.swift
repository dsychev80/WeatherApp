//
//  TodayCellLabel.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

class WeatherCellLabel: UILabel {
    
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
        clipsToBounds = true
    }
    
    public func configurate(with font: UIFont?, textColor color: UIColor) {
        self.font = font
        self.textColor = color
    }
}
