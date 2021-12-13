//
//  TodayCellLabel.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

class WeatherCellLabel: UILabel {
    
    // MARK: - LifeCycle
    required init(withFont newFont: UIFont, fontColor color: UIColor, andText text: String = "") {
        super.init(frame: .zero)
        self.text = text
        self.font = newFont
        self.textColor = color
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
    }
}
