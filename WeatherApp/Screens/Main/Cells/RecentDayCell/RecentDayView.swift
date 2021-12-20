//
//  RecentDayView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

//MARK: - Constants
fileprivate let СONTENT_VIEW_WIDTH: CGFloat = 345
fileprivate let CONTENT_VIEW_HEIGHT: CGFloat = 214
fileprivate let HEADER_LEFT_RIGHT_GAP_TO_CONTENT_VIEW: CGFloat = 20
fileprivate let TOP_BOTTOM_GAP: CGFloat = 16

class RecentDayView: UIView {

    // MARK: - Properties
    private var collectionViewAdapter: RecentDayCollectionAdapter
    private var backView = RecentDayCellBackView()
    private var cellHeaderContainerView = RecentHeaderView()
    private var separatorView = SeparatorView()
    private var collectionView = RecentDayCollectionView()
    
    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        collectionViewAdapter = RecentDayCollectionAdapter(with: collectionView)
        super.init(frame: .zero)
        setup()
    }
    
    // MARK: - Methods
    private func setup() {

        setupLayout()
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        self.snp.makeConstraints { make in
            make.height.equalTo(CONTENT_VIEW_HEIGHT).priorityHigh()
            make.width.equalTo(СONTENT_VIEW_WIDTH).priorityHigh()
        }
        
        self.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16))
        }
  
        backView.addSubview(cellHeaderContainerView)
        cellHeaderContainerView.snp.makeConstraints { make in
            make.left.equalTo(backView).offset(HEADER_LEFT_RIGHT_GAP_TO_CONTENT_VIEW)
            make.right.equalTo(backView).offset(-HEADER_LEFT_RIGHT_GAP_TO_CONTENT_VIEW)
            make.top.equalTo(backView).offset(TOP_BOTTOM_GAP)
            make.height.equalTo(28)
        }
        
        backView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(cellHeaderContainerView.snp.bottom).offset(15.14)
            make.left.equalTo(backView).offset(HEADER_LEFT_RIGHT_GAP_TO_CONTENT_VIEW)
            make.right.equalTo(backView).offset(-HEADER_LEFT_RIGHT_GAP_TO_CONTENT_VIEW)
        }
        
        backView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(TOP_BOTTOM_GAP)
            make.left.equalTo(backView)
            make.right.equalTo(backView)
            make.bottom.equalTo(backView.snp.bottom).offset(-TOP_BOTTOM_GAP)
        }
    }
    
    public func configure(with forecast: ForecastForDay) {
        cellHeaderContainerView.configure(with: forecast)
        collectionViewAdapter.configure(with: forecast.forecastByHour)
    }
}
