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
fileprivate let BUTTON_SIDE_GAP: CGFloat = 16
fileprivate let BUTTON_SIZE: CGFloat = 32
fileprivate let BETWEEN_BUTTON_GAP: CGFloat = 8

class NavigationBar: UIView {
    // MARK: - Properties
    private let title = WeatherCellLabel(withFont: AppFont.extraBold.size(18), fontColor: TITLE_COLOR)
    private let eventHandler: EventHandler
    
    private let pointButton = UIButton()
    private let searchButton = UIButton()
    private let themeButton = UIButton()
    
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
        
        configureButtons()
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    private func configureButtons() {
        pointButton.addTarget(eventHandler, action: #selector(EventHandler.selectOnMap), for: .touchUpInside)
        pointButton.setImage(UIImage(named: "Point"), for: .normal)
        
        searchButton.addTarget(eventHandler, action: #selector(EventHandler.search), for: .touchUpInside)
        searchButton.setImage(UIImage(named: "Search"), for: .normal)
        
        themeButton.addTarget(eventHandler, action: #selector(EventHandler.changeTheme), for: .touchUpInside)
        themeButton.setImage(UIImage(named: "Theme"), for: .normal)
    }
    
    private func setupViewHierarchy() {
        self.addSubview(pointButton)
        self.addSubview(searchButton)
        self.addSubview(themeButton)
        self.addSubview(title)
    }
    
    private func setupLayoutConstraints() {
        pointButton.snp.makeConstraints { make in
            make.height.equalTo(BUTTON_SIZE)
            make.width.equalTo(BUTTON_SIZE)
            make.left.equalTo(self.snp_left).offset(BUTTON_SIDE_GAP)
            make.bottom.equalTo(self.snp_bottom).offset(-BUTTON_SIDE_GAP)
        }
        
        title.snp.makeConstraints { make in
            make.height.equalTo(TITLE_HEIGHT)
            make.bottom.equalTo(self.snp_bottom).offset(-TITLE_BOTTOM_GAP)
            make.centerX.equalToSuperview()
        }
        
        themeButton.snp.makeConstraints { make in
            make.width.equalTo(BUTTON_SIZE)
            make.height.equalTo(BUTTON_SIZE)
            make.bottom.equalTo(self.snp_bottom).offset(-BUTTON_SIDE_GAP)
            make.right.equalTo(self.searchButton.snp_left).offset(-BETWEEN_BUTTON_GAP)
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.equalTo(BUTTON_SIZE)
            make.height.equalTo(BUTTON_SIZE)
            make.bottom.equalTo(self.snp_bottom).offset(-BUTTON_SIDE_GAP)
            make.right.equalTo(self.snp_right).offset(-BUTTON_SIDE_GAP)
        }
    }
    
    public func configure(withData data: String) {
        self.title.text = data
    }
}

@objc protocol EventHandler: AnyObject {
    func selectOnMap()
    func search()
    func changeTheme()
}
