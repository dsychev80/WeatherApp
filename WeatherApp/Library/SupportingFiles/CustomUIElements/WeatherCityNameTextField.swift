//
//  WeatherCityNameTextField.swift
//  WeatherApp
//
//  Created by Denis Sychev on 27.11.2021.
//

import UIKit

class WeatherCityNameTextField: UITextField {
    // MARK: - Constants
    private struct Constants {
        static let textFieldBorderColor = UIColor(displayP3Red: 231/255, green: 236/255, blue: 243/255, alpha: 1)
        
        // insets
        static let topInset: CGFloat = 8
        static let leftInset: CGFloat = 40
        static let bottomInset: CGFloat = 8
        static let rightInset: CGFloat = 14
        
        static let imageGap: CGFloat = 8
        static let cornerRadius: CGFloat = 12
        static let borderWidth: CGFloat = 1
    }
    // MARK: - Properties
    let insets: UIEdgeInsets
    
    // MARK: - Lifecycle
    required init() {
        self.insets = UIEdgeInsets(top: Constants.topInset,
                                   left: Constants.leftInset,
                                   bottom: Constants.bottomInset,
                                   right: Constants.rightInset)
        super.init(frame: CGRect.zero)
        configurate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func configurate() {
        self.layer.borderWidth = Constants.borderWidth
        self.layer.borderColor = Constants.textFieldBorderColor.cgColor
        self.layer.cornerRadius = Constants.cornerRadius
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
