//
//  SityCancelButton.swift
//  WeatherApp
//
//  Created by Denis Sychev on 06.12.2021.
//

import UIKit

class SityCancelButton: UIButton {

    // MARK: - LifeCycle
    required init(withTarget target: Any?, selector: Selector) {
        super.init(frame: .zero)
        self.addTarget(target, action: selector, for: .touchUpInside)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        self.backgroundColor = SityCancelButton.CANCEL_BUTTON_COLOR
        self.layer.cornerRadius = 12
        self.titleLabel?.font = AppFont.bold.size(14)
        self.setTitleColor(SityCancelButton.CANCEL_BUTTON_TEXT_COLOR, for: .normal)
        self.setTitle("Отменить", for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Constants
    static let CANCEL_BUTTON_COLOR = UIColor(displayP3Red: 243/255, green: 245/255, blue: 248/255, alpha: 1)
    static let CANCEL_BUTTON_TEXT_COLOR = UIColor(displayP3Red: 112/255, green: 119/255, blue: 130/255, alpha: 1)
}
