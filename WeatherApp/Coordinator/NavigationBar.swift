//
//  NavigationBar.swift
//  WeatherApp
//
//  Created by Denis Sychev on 14.12.2021.
//

import UIKit

// MARK: - Constants
fileprivate let NAVIGATION_BAR_COLOR = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 0.98)
fileprivate let TITLE_COLOR = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
fileprivate let TITLE_HEIGHT: CGFloat = 30
fileprivate let TITLE_BOTTOM_GAP: CGFloat = 17

class NavigationBar: UIView {
    // MARK: - Properties
    private let title = WeatherCellLabel(withFont: AppFont.extraBold.size(18), fontColor: TITLE_COLOR, andText: "Tambov")
    private let eventHandler: EventHandler
    
    // MARK: - Lifecycle
    required init(with eventHandler: EventHandler) {
        self.eventHandler = eventHandler
        let screenWidth = UIScreen.main.bounds.width
        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 84))
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        backgroundColor = NAVIGATION_BAR_COLOR
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    private func setupViewHierarchy() {
        self.addSubview(title)
    }
    
    private func setupLayoutConstraints() {
        title.snp.makeConstraints { make in
            make.height.equalTo(TITLE_HEIGHT)
            make.bottom.equalTo(self.snp_bottom).offset(-TITLE_BOTTOM_GAP)
            make.centerX.equalToSuperview()
        }
    }
    
    public func configure(withData data: String) {
        self.title.text = data
    }
}

protocol EventHandler {
    
}
