//
//  MainTableView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

class MainTableView: UITableView {
    // MARK: - LifeCycle
    required init(with dataSource: UITableViewDataSource? = nil,
                  delegate: UITableViewDelegate? = nil) {
        super.init(frame: CGRect.zero, style: .plain)
        setup()
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Methods
    private func setup() {
        self.separatorStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(TodayCell.self, forCellReuseIdentifier: TodayCell.name)
        self.register(RecentDayCell.self, forCellReuseIdentifier: RecentDayCell.name)
    }
}
