//
//  MainView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 02.12.2021.
//

import UIKit

class MainView: UITableView {
    // MARK: - Properties
    private var diffableDataSource: UITableViewDiffableDataSource<Int, Item>!
    
    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        super.init(frame: CGRect.zero, style: .plain)
        styleSetup()
        diffableDataSourceSetup()
    }
    
    // MARK: - Methods
    private func styleSetup() {
        self.separatorStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.register(TodayCell.self, forCellReuseIdentifier: TodayCell.name)
        self.register(RecentDayCell.self, forCellReuseIdentifier: RecentDayCell.name)
        
        self.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = .white
    }
    
    private func diffableDataSourceSetup() {
        diffableDataSource = UITableViewDiffableDataSource<Int, Item>(tableView: self) {
            (tableView: UITableView, indexPath: IndexPath, item: Item) -> UITableViewCell? in
            tableView.createWeatherDayCell(for: indexPath, with: item)
        }
        self.dataSource = diffableDataSource
    }
    
    public func configure(with items: [Item]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Item>()
        snapshot.appendSections([0])
        snapshot.appendItems(items, toSection: 0)
        diffableDataSource.apply(snapshot, animatingDifferences: false, completion: nil)
    }
}

extension MainView: ContentView {
    func configureWithData(_ data: [Item]) {
        configure(with: data)
    }
}
