//
//  TodayCellBackgroundView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

class TodayCellBackgroundView: UIView {
    
    // MARK: - LifeCycle
    required init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        self.roundCorners()
        self.backgroundColor = UIColor(displayP3Red: 110/255, green: 170/255, blue: 249/255, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
