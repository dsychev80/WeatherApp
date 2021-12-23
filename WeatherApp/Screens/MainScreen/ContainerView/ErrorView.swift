//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 23.12.2021.
//

import UIKit

fileprivate let ERROR_LABEL_WIDTH: CGFloat = 300

class ErrorView: UIView {
    // MARK: - Properties
    private let errorLabel: WeatherCellLabel
    
    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        self.errorLabel = WeatherCellLabel()
        super.init(frame: .zero)
        setup()
    }
    
    private func setup() {
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        
        self.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalTo(ERROR_LABEL_WIDTH)
        }
    }
    
    public func showErrorText(_ text: String) {
        errorLabel.text = text
    }
}
