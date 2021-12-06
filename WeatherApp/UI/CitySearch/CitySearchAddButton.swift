//
//  CitySearchAddButton.swift
//  WeatherApp
//
//  Created by Denis Sychev on 06.12.2021.
//

import UIKit

class CitySearchAddButton: SityCancelButton {

    // MARK: - LifeCycle
    required init(withTarget target: Any?, selector: Selector) {
        super.init(withTarget: target, selector: selector)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setup() {
        self.backgroundColor = CitySearchAddButton.ADD_BUTTON_COLOR
        self.layer.cornerRadius = 12
        self.titleLabel?.font = AppFont.bold.size(14)
        self.setTitle("Добавить", for: .normal)
        self.setTitleColor(CitySearchAddButton.ADD_BUTTON_TEXT_COLOR, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: - Constants
    static let ADD_BUTTON_COLOR = UIColor(displayP3Red: 53/255, green: 153/255, blue: 255/255, alpha: 1)
    static let ADD_BUTTON_TEXT_COLOR = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
}
