//
//  NavigationBar.swift
//  WeatherApp
//
//  Created by Denis Sychev on 14.12.2021.
//

import UIKit

// MARK: - Constants
fileprivate let NAVIGATION_BAR_COLOR = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 0.98)

class NavigationBar: UIView {

    // MARK: - Lifecycle
    required init() {
        let screenWidth = UIScreen.main.bounds.width
        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 84))
        
        backgroundColor = NAVIGATION_BAR_COLOR
        
//        translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
    }
}
