//
//  SeparatorView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class SeparatorView: UIView {

    // MARK: - LifeCycle
    /// Default color: UIColor(displayP3Red: 217/255, green: 224/255, blue: 234/255, alpha: 1)
    required init(withColor color: UIColor = UIColor(displayP3Red: 217/255, green: 224/255, blue: 234/255, alpha: 1)) {
        super.init(frame: .zero)
        backgroundColor = color
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }
    
}
