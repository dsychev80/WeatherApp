//
//  RecentDayTableViewCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 23.11.2021.
//

import UIKit

class RecentDayCell: UITableViewCell {

    // MARK: - Properties
    var cellView = RecentDayView()

    // MARK: - Lifecycle
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    // MARK: - Methods
    private func setup() {
        selectionStyle = .none
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    // Use this function to configure cell with data
    public func configure(with data: ForecastData) {
        cellView.configure(with: data)
    }
    
    private func setupViewHierarchy() {
        contentView.addSubview(cellView)
    }
    
    private func setupLayoutConstraints() {
        cellView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
