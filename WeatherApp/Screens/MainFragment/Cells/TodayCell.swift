//
//  TodayCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 23.11.2021.
//

import UIKit


final class TodayCell: UITableViewCell {
    
    // MARK: - Properties
    private var view = TodayCellView()
    
    // MARK: - Life cycle
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        selectionStyle = .none
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    // MARK: - Methods
    
    // Use this function to configure cell with data
    public func configure(with data: TodayData) {
        view.configure(with: data)
    }
    
    private func setup() {
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}

