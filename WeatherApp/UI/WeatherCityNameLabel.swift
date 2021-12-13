//
//  WeatherCityNameLabel.swift
//  WeatherApp
//
//  Created by Denis Sychev on 27.11.2021.
//

import UIKit

class WeatherCityNameLabel: UILabel {
    // MARK: - Properties
    let insets: UIEdgeInsets
    
    // MARK: - Lifecycle
    required init(withInsets top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: self.insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.width += insets.right + insets.left
            contentSize.height += insets.top + insets.bottom
            return contentSize
        }
    }
}
