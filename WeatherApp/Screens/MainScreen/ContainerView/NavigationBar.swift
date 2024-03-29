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
    private let title = WeatherCellLabel()
    private let pointButton = UIButton()
    private let searchButton = UIButton()
    private let themeButton = UIButton()
    private let eventHandler: NavigationBarEventHandler
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(with eventHandler: NavigationBarEventHandler) {
        let screenWidth = UIScreen.main.bounds.width
        self.eventHandler = eventHandler
        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 84))
        
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        setupStyle()
        setupLayout()
        configureButtons()
    }
    
    fileprivate func setupStyle() {
        backgroundColor = NAVIGATION_BAR_COLOR
        title.configurate(with: R.font.manropeExtraBold(size: 18), textColor: TITLE_COLOR)
    }
    
    private func setupLayout() {
        self.addSubview(pointButton)
        pointButton.snp.makeConstraints { make in
            make.height.equalTo(BUTTON_SIZE)
            make.width.equalTo(BUTTON_SIZE)
            make.left.equalTo(self.snp_left).offset(BUTTON_SIDE_GAP)
            make.bottom.equalTo(self.snp_bottom).offset(-BUTTON_SIDE_GAP)
        }
        
        self.addSubview(title)
        title.snp.makeConstraints { make in
            make.height.equalTo(TITLE_HEIGHT)
            make.bottom.equalTo(self.snp_bottom).offset(-TITLE_BOTTOM_GAP)
            make.centerX.equalToSuperview()
        }
        
        self.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.width.equalTo(BUTTON_SIZE)
            make.height.equalTo(BUTTON_SIZE)
            make.bottom.equalTo(self.snp_bottom).offset(-BUTTON_SIDE_GAP)
            make.right.equalTo(self.snp_right).offset(-BUTTON_SIDE_GAP)
        }
        
        self.addSubview(themeButton)
        themeButton.snp.makeConstraints { make in
            make.width.equalTo(BUTTON_SIZE)
            make.height.equalTo(BUTTON_SIZE)
            make.bottom.equalTo(self.snp_bottom).offset(-BUTTON_SIDE_GAP)
            make.right.equalTo(self.searchButton.snp_left).offset(-BETWEEN_BUTTON_GAP)
        }
    }
    
    public func setTitle(with text: String) {
        self.title.text = text
    }
    
    private func configureButtons() {
        pointButton.addTarget(self, action: #selector(selectOnMap), for: .touchUpInside)
        pointButton.setImage(R.image.point(), for: .normal)
        
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        searchButton.setImage(R.image.search(), for: .normal)
        
        themeButton.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
        themeButton.setImage(R.image.theme(), for: .normal)
    }
    
    @objc private func selectOnMap() {
        eventHandler.selectOnMap()
    }
    
    @objc private func search() {
        eventHandler.search()
    }
    
    @objc private func changeTheme() {
        eventHandler.changeTheme()
    }
}

protocol NavigationBarEventHandler {
    func selectOnMap()
    func search()
    func changeTheme()
}
