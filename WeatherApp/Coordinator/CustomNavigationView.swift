//
//  CustomNavigationView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 14.12.2021.
//

import UIKit

class CustomNavigationView: UIView {

    // MARK: - Properties
    private var navigationBar: NavigationBar
    private var contentView: UIView
    
    // MARK: - LifeCycle
    required init(withView view: UIView) {
        navigationBar = NavigationBar()
        contentView = view
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {

        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    private func setupViewHierarchy() {
        self.addSubview(contentView)
        self.addSubview(navigationBar)
    }
    
    private func setupLayoutConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_top)
            make.left.equalTo(self.snp_left)
            make.bottom.equalTo(self.snp_bottom)
            make.right.equalTo(self.snp_right)
        }
    }
}
