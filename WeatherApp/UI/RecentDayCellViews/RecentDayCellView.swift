//
//  RecentDayCellView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 03.12.2021.
//

import UIKit

class RecentDayCellView: UIView {

    // MARK: - Properties
    private var backView = RecentDayCellBackView()
    private var cellHeaderContainerView = RecentHeaderView()
    private var separatorView = SeparatorView()
    private var collectionView = RecentDayCollectionView()
    private var forecast: ForecastData?
    
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

        forecast = data
        collectionView.reloadData()
    }
    
    private func setup() {
        collectionView.dataSource = self
    
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

        let widthConstraint = self.widthAnchor.constraint(equalToConstant: СONTENT_VIEW_WIDTH)
        widthConstraint.priority = .defaultHigh
        widthConstraint.isActive = true
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: CONTENT_VIEW_HEIGHT)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true
        
        backView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        backView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        
        cellHeaderContainerView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16).isActive = true
        cellHeaderContainerView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20).isActive = true
        cellHeaderContainerView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20).isActive = true
        cellHeaderContainerView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        separatorView.topAnchor.constraint(equalTo: cellHeaderContainerView.bottomAnchor, constant: 15.14).isActive = true
        separatorView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20).isActive = true
        separatorView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 16).isActive = true
        collectionView.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: backView.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16).isActive = true
    }
    
    //MARK: - Constants    
    private let СONTENT_VIEW_WIDTH: CGFloat = 343
    private let CONTENT_VIEW_HEIGHT: CGFloat = 214
    private let HEADER_LEFT_RIGHT_GAP_TO_CONTENT_VIEW: CGFloat = 20
}

extension RecentDayCellView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let forecast = forecast?.forecast else { return 0 }
        return forecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourWeatherCell.name, for: indexPath) as! HourWeatherCell
        guard let forecast = forecast else { return cell }
        cell.configure(with: forecast.forecast[indexPath.row])
        DispatchQueue.main.async {
            collectionView.reloadData()
        }
        return cell
    }
}

protocol RecentDayHeaderData {
    var dayDate: String { get }
    var dayAverageTemp: String { get }
    var dayMaxTemp: String { get }
}
