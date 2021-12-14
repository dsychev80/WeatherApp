//
//  SearchBackView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 14.12.2021.
//

import UIKit

// MARK: - Constants
fileprivate let VIEW_BACKGROUND_COLOR = UIColor(displayP3Red: 28/255, green: 28/255, blue: 30/255, alpha: 0.9)

class SearchBackView: UIView {
    // MARK: - Properties
    let searchView: SearchView!

    // MARK: - LifeCycle
    required init(withDelegate delegate: CitySearchDelegate) {
        searchView = SearchView(withDelegate: delegate)
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    private func setup() {
        self.backgroundColor = VIEW_BACKGROUND_COLOR
        setupViewHierarchy()
        setupLayoutConstraints()
    }

    private func setupViewHierarchy() {
        self.addSubview(searchView)
    }

    private func setupLayoutConstraints() {
        searchView.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
}
