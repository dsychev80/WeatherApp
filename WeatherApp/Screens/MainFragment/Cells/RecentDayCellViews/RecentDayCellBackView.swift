//
//  RecentDayCellBackView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class RecentDayCellBackView: UIView {

    // MARK: - LifeCycle
    required init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setup() {
        self.roundCorners()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        // FIXME: Need to change for theme supporting
        self.backgroundColor = CONTENT_VIEW_BACKGROUND_COLOR
    }
    
    // MARK: - Constants
    private let CONTENT_VIEW_BACKGROUND_COLOR = UIColor(displayP3Red: 243/255, green: 245/255, blue: 248/255, alpha: 1)
}
