//
//  HourBackgroundView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class HourBackgroundView: UIView {

    // MARK: - LifeCycle
    required init(withColor color: UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = color
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        self.layer.cornerRadius = CORNER_RADIUS
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let CORNER_RADIUS: CGFloat = 16
}
