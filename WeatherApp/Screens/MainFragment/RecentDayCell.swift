//
//  RecentDayTableViewCell.swift
//  WeatherApp
//
//  Created by Denis Sychev on 23.11.2021.
//

import UIKit

class RecentDayCell: UITableViewCell {
    
    // MARK:- Constants
    struct Constants {
        static let contentViewBackgroundColor = UIColor(displayP3Red: 243/255, green: 245/255, blue: 248/255, alpha: 1)
        static let contentViewWidth: CGFloat = 343
        static let contentViewHeight: CGFloat = 214
        
        static let blackFontColor = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
        static let greyFontColor = UIColor(displayP3Red: 143/255, green: 150/255, blue: 161/255, alpha: 1)
        
        static let separatorColor = UIColor(displayP3Red: 217/255, green: 224/255, blue: 234/255, alpha: 1)
        
        static let dataLabelWidth: CGFloat = 115
        static let dataLabelHeight: CGFloat = 28.14
        
        static let minMaxLabelWidth: CGFloat = 32
        static let minMaxLabelHeight: CGFloat = 28.14
        
        static let weatherImageHeight: CGFloat = 24.12
        static let weatherImageWidth: CGFloat = 30
        
        static let headerLeftRightGapToContentView: CGFloat = 20
    }

    // MARK: - Properties
    private var backView: UIView = {
        let view = UIView()
        view.roundCorners()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        // FIXME: Need to change for theme supporting
        view.backgroundColor = Constants.contentViewBackgroundColor
        return view
    }()

    private var cellHeaderContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var dataLabel: UILabel = {
        let label = UILabel()
        label.makeTextWhite()
        label.font = AppFont.medium.size(16)
        label.textColor = Constants.blackFontColor
        // FIXME: Default data, need to delete after creating model.
        label.text = "13 августа, пт"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    private var maxTempLabel: UILabel = {
        let label = UILabel()
        label.makeTextWhite()
        label.font = AppFont.extraBold.size(16)
        label.textColor = Constants.greyFontColor
        // FIXME: Default data, need to delete after creating model.
        label.text = "26°"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    private var minTempLabel: UILabel = {
        let label = UILabel()
        label.makeTextWhite()
        label.font = AppFont.extraBold.size(16)
        label.textColor = Constants.blackFontColor
        // FIXME: Default data, need to delete after creating model.
        label.text = "25°"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    private var weatherImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Sun"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 73, height: 114)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HourWeatherCell.self, forCellWithReuseIdentifier: HourWeatherCell.name)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var forecast: ForecastData?

    // MARK: - Life cycle
    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewHierarchy()
        setupLayoutConstraints()
        
        collectionView.dataSource = self
        
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    // MARK: - Methods
    // Use this function to configure cell with data
    public func configure(with data: ForecastData) {
        forecast = data
        dataLabel.text = data.date
        minTempLabel.text = data.averageTemp()
        maxTempLabel.text = data.maxTemp
        // FIXME: implement icon configuration
        
        collectionView.reloadData()
    }
    
    private func setupViewHierarchy() {
        backView.addSubview(cellHeaderContainerView)
        cellHeaderContainerView.addSubview(dataLabel)
        cellHeaderContainerView.addSubview(minTempLabel)
        cellHeaderContainerView.addSubview(maxTempLabel)
        cellHeaderContainerView.addSubview(weatherImage)
        backView.addSubview(cellHeaderContainerView)
        backView.addSubview(separatorView)
        backView.addSubview(collectionView)
        contentView.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        
        let widthConstraint = contentView.widthAnchor.constraint(equalToConstant: Constants.contentViewWidth)
        widthConstraint.priority = .defaultHigh
        widthConstraint.isActive = true
        let heightConstraint = contentView.heightAnchor.constraint(equalToConstant: Constants.contentViewHeight)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true
        
        backView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        backView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        cellHeaderContainerView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16).isActive = true
        cellHeaderContainerView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20).isActive = true
        cellHeaderContainerView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20).isActive = true
        cellHeaderContainerView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        for view in cellHeaderContainerView.subviews {
            view.centerYAnchor.constraint(equalTo: cellHeaderContainerView.centerYAnchor).isActive = true
        }
    
        dataLabel.widthAnchor.constraint(equalToConstant: Constants.dataLabelWidth).isActive = true
        minTempLabel.widthAnchor.constraint(equalToConstant: Constants.minMaxLabelWidth).isActive = true
        maxTempLabel.widthAnchor.constraint(equalToConstant: Constants.minMaxLabelWidth).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: Constants.weatherImageWidth).isActive = true
        
        dataLabel.leftAnchor.constraint(equalTo: cellHeaderContainerView.leftAnchor).isActive = true
        maxTempLabel.leftAnchor.constraint(equalTo: minTempLabel.rightAnchor, constant: 8).isActive = true
        maxTempLabel.rightAnchor.constraint(equalTo: weatherImage.leftAnchor, constant: -16).isActive = true
        weatherImage.rightAnchor.constraint(equalTo: cellHeaderContainerView.rightAnchor).isActive = true
        
        weatherImage.heightAnchor.constraint(equalToConstant: Constants.weatherImageHeight).isActive = true
        
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.topAnchor.constraint(equalTo: cellHeaderContainerView.bottomAnchor, constant: 15.14).isActive = true
        
        separatorView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20).isActive = true
        separatorView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 16).isActive = true
        
        collectionView.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: backView.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16).isActive = true
    }
}

extension RecentDayCell: UICollectionViewDataSource {
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
