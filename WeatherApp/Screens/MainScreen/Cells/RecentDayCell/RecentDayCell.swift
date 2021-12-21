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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }

    // MARK: - Methods
    private func setup() {
        selectionStyle = .none

        setupLayout()
    }
    
    private func setupLayout() {
        contentView.addSubview(cellView)
        cellView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    public func configure(with forecast: ForecastForDay) {
        cellView.configure(with: forecast)
    }
}
