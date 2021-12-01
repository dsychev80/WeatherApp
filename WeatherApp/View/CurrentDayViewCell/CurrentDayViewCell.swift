//
//  CurrentDayViewCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 30.11.2021.
//

import UIKit

class CurrentDayViewCell: UITableViewCell {
    
    private var mainView: CurrentDayView!
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backView.frame = CGRect(x: 16, y: 16, width: 343, height: 280)
        print(self.contentView.frame)
        mainView = CurrentDayView(frame: self.contentView.frame)
        contentView.addSubview(mainView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
