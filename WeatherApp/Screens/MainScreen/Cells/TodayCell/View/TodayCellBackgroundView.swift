//
//  TodayCellBackgroundView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

fileprivate let FIRST_COLOR = UIColor(displayP3Red: 110/255, green: 170/255, blue: 248/255, alpha: 1)
fileprivate let SECOND_COLOR = UIColor(displayP3Red: 96/255, green: 161/255, blue: 248/255, alpha: 1)
fileprivate let THIRD_COLOR = UIColor(displayP3Red: 84/255, green: 67/255, blue: 200/255, alpha: 1)
fileprivate let FOURTH_COLOR = UIColor(displayP3Red: 242/255, green: 170/255, blue: 80/255, alpha: 1)

class TodayCellBackgroundView: UIView {
    // MARK: - Properties
    private var backgroundView: CanvasView!
    
    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        super.init(frame: .zero)
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundView = CanvasView(withColors: THIRD_COLOR, color2: FOURTH_COLOR)
        backgroundView.clipsToBounds = true
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
