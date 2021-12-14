//
//  MainTableView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

class MainTableView: UITableView {
    // MARK: - LifeCycle
    private var diffableDataSource: UITableViewDiffableDataSource<Int, Item>!
    
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
        self.translatesAutoresizingMaskIntoConstraints = false

        self.register(TodayCell.self, forCellReuseIdentifier: TodayCell.name)
        self.register(RecentDayCell.self, forCellReuseIdentifier: RecentDayCell.name)
        
        contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        let underlyingView = UIView()
        underlyingView.backgroundColor = .white
        self.backgroundView = underlyingView
        
        diffableDataSource = UITableViewDiffableDataSource<Int, Item>(tableView: self) {
            (tableView: UITableView, indexPath: IndexPath, item: Item) -> UITableViewCell? in
            switch item {
            case .today(let todayData):
                let cell = tableView.dequeueReusableCell(withIdentifier: TodayCell.name, for: indexPath) as! TodayCell
                cell.configure(with: todayData)
                return cell
            case .forecast(let forecastData):
                let cell = tableView.dequeueReusableCell(withIdentifier: RecentDayCell.name, for: indexPath) as! RecentDayCell
                cell.configure(with: forecastData)
                return cell
            }
        }
        self.dataSource = diffableDataSource
    }
    
    public func configure(with items: [Item]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Item>()
        snapshot.appendSections([0])
        snapshot.appendItems(items, toSection: 0)
        diffableDataSource.apply(snapshot)
    }
}
