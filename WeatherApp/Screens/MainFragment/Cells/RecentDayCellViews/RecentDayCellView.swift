//
//  RecentDayCellView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class RecentDayCellView: UIView {

    // MARK: - Properties
    private var collectionViewAdapter = RecentDayCollectionAdapter()
    
    private var backView = RecentDayCellBackView()
    private var cellHeaderContainerView = RecentHeaderView()
    private var separatorView = SeparatorView()
    private var collectionView = RecentDayCollectionView()
    
    // MARK: - LifeCycle
    required init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func configure(with data: ForecastData) {
        cellHeaderContainerView.configure(withData: data)
        collectionViewAdapter.getForcastData(data.forecast)
        collectionView.reloadData()
    }
    
    private func setup() {
        collectionView.dataSource = collectionViewAdapter
    
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    private func setupViewHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backView.addSubview(cellHeaderContainerView)
        backView.addSubview(separatorView)
        backView.addSubview(collectionView)
        
        self.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(CONTENT_VIEW_HEIGHT).priorityHigh()
            make.width.equalTo(СONTENT_VIEW_WIDTH).priorityHigh()
        }
        
        backView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16))
        }
  
        cellHeaderContainerView.snp.makeConstraints { make in
            make.left.equalTo(backView).offset(20)
            make.right.equalTo(backView).offset(-20)
            make.top.equalTo(backView).offset(16)
            make.height.equalTo(28)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(cellHeaderContainerView.snp.bottom).offset(15.14)
            make.left.equalTo(backView).offset(20)
            make.right.equalTo(backView).offset(-20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(16)
            make.left.equalTo(backView)
            make.right.equalTo(backView)
            make.bottom.equalTo(backView.snp.bottom).offset(-16)
        }
    }
    
    //MARK: - Constants    
    private let СONTENT_VIEW_WIDTH: CGFloat = 345
    private let CONTENT_VIEW_HEIGHT: CGFloat = 214
    private let HEADER_LEFT_RIGHT_GAP_TO_CONTENT_VIEW: CGFloat = 20
}
