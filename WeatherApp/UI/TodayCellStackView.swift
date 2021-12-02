//
//  TodayCellStackView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

class TodayCellStackView: UIStackView {

    // MARK: - LifeCycle
    required init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        self.axis = .vertical
        self.alignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
