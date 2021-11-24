//
//  UIKit+Extensions.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit

protocol Nameable {
    static var name: String { get }
}

extension Nameable {
    static var name: String {
        return String(describing: self)
    }
}

extension UIView: Nameable {}
extension UIViewController: Nameable {}

extension UINavigationController {
    func styleNavBar() {
        let label = UILabel()
        label.text = "HowToChangeNameCity"
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.topItem?.titleView = label
        self.navigationBar.shadowImage = UIImage()
    }
}

extension UIView {
    func roundCorners() {
        self.layer.cornerRadius = 20
    }
}

extension UIView {
    func makeEqualConstraintsToView(_ view: UIView, withGap gap: CGFloat = 0) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: gap).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: gap).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -gap).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -gap).isActive = true
    }
    
    func makeConstraintsToView(_ view: UIView, top: CGFloat, bottom: CGFloat, right: CGFloat, left: CGFloat) {
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: left).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -right).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottom).isActive = true
    }
}

extension UILabel {
    func makeTextWhite() {
        self.textColor = .white
    }
}
