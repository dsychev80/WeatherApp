//
//  MainTableView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

class MainTableView: UITableView {
    // MARK: - LifeCycle
    required init() {
        super.init(frame: CGRect.zero, style: .plain)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        self.separatorStyle = .none

        self.register(TodayCell.self, forCellReuseIdentifier: TodayCell.name)
        self.register(RecentDayCell.self, forCellReuseIdentifier: RecentDayCell.name)
    }
}
