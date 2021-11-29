//
//  WeatherCityNameTextField.swift
//  WeatherApp
//
//  Created by Denis Sychev on 27.11.2021.
//

import UIKit

class WeatherCityNameTextField: UITextField {

    private struct Constants {
        static let imageGap: CGFloat = 8
    }
    
    let insets: UIEdgeInsets
    
    required init(withInsets top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.insets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: self.insets)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        guard let width = leftView?.frame.width else { return bounds }
        return bounds.inset(by: UIEdgeInsets(top: Constants.imageGap,
                                             left: Constants.imageGap,
                                             bottom: Constants.imageGap,
                                             right: bounds.width - (width + Constants.imageGap)))

    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        guard let width = rightView?.frame.width else { return bounds }
        return bounds.inset(by: UIEdgeInsets(top: Constants.imageGap,
                                             left: bounds.width - (width + Constants.imageGap),
                                             bottom: Constants.imageGap,
                                             right: Constants.imageGap))
    }
}
