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


extension UIView {
    func roundCorners() {
        self.layer.cornerRadius = 20
    }
}
