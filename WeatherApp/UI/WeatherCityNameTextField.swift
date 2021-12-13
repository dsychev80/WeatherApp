//
//  WeatherCityNameTextField.swift
//  WeatherApp
//
//  Created by Denis Sychev on 27.11.2021.
//

import UIKit

// MARK: - Constants
fileprivate let textFieldBorderColor = UIColor(displayP3Red: 231/255, green: 236/255, blue: 243/255, alpha: 1)
// insets
fileprivate let topInset: CGFloat = 8
fileprivate let leftInset: CGFloat = 40
fileprivate let bottomInset: CGFloat = 8
fileprivate let rightInset: CGFloat = 14

fileprivate let imageGap: CGFloat = 8
fileprivate let cornerRadius: CGFloat = 12
fileprivate let borderWidth: CGFloat = 1

class WeatherCityNameTextField: UITextField {
    // MARK: - Properties
    let insets: UIEdgeInsets
    
    // MARK: - Lifecycle
    required init() {
        self.insets = UIEdgeInsets(top: topInset,
                                   left: leftInset,
                                   bottom: bottomInset,
                                   right: rightInset)
        super.init(frame: CGRect.zero)
        configurate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func configurate() {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = textFieldBorderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.leftView = UIImageView(image: UIImage(named: "textSearch"))
        self.rightView = UIImageView(image: UIImage(named: "Plus"))
        self.rightViewMode = .whileEditing
        self.leftViewMode = .always
        self.borderStyle = .none
        self.clearButtonMode = .whileEditing
        self.translatesAutoresizingMaskIntoConstraints = false
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
        return bounds.inset(by: UIEdgeInsets(top: imageGap,
                                             left: imageGap,
                                             bottom: imageGap,
                                             right: bounds.width - (width + imageGap)))

    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        guard let width = rightView?.frame.width else { return bounds }
        return bounds.inset(by: UIEdgeInsets(top: imageGap,
                                             left: bounds.width - (width + imageGap),
                                             bottom: imageGap,
                                             right: imageGap))
    }
}
