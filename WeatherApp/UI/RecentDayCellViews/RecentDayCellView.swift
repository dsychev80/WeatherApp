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
    private var cellHeaderContainerView = UIView()
    private var dataLabel = WeatherCellLabel(withFont: AppFont.medium.size(16), fontColor: .black)
    private var maxTempLabel = WeatherCellLabel(withFont: AppFont.extraBold.size(16), fontColor: Constants.greyFontColor)
    private var minTempLabel = WeatherCellLabel(withFont: AppFont.extraBold.size(16), fontColor: Constants.blackFontColor)
    
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
        forecast = data
        dataLabel.text = data.date
        minTempLabel.text = data.averageTemp()
        maxTempLabel.text = data.maxTemp
        // FIXME: implement icon configuration
        
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
        cellHeaderContainerView.addSubview(dataLabel)
        cellHeaderContainerView.addSubview(minTempLabel)
        cellHeaderContainerView.addSubview(maxTempLabel)
        cellHeaderContainerView.addSubview(weatherImage)
        backView.addSubview(cellHeaderContainerView)
        backView.addSubview(separatorView)
        backView.addSubview(collectionView)
        self.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        cellHeaderContainerView.translatesAutoresizingMaskIntoConstraints = false
        let widthConstraint = self.widthAnchor.constraint(equalToConstant: Сontent_View_Width)
        widthConstraint.priority = .defaultHigh
        widthConstraint.isActive = true
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: Content_View_Height)
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
        
        for view in cellHeaderContainerView.subviews {
            view.centerYAnchor.constraint(equalTo: cellHeaderContainerView.centerYAnchor).isActive = true
        }
    
        dataLabel.widthAnchor.constraint(equalToConstant: Data_Label_Width).isActive = true
        minTempLabel.widthAnchor.constraint(equalToConstant: Min_Max_Label_Width).isActive = true
        maxTempLabel.widthAnchor.constraint(equalToConstant: Min_Max_Label_Width).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: Weather_Image_Width).isActive = true
        
        dataLabel.leftAnchor.constraint(equalTo: cellHeaderContainerView.leftAnchor).isActive = true
        maxTempLabel.leftAnchor.constraint(equalTo: minTempLabel.rightAnchor, constant: 8).isActive = true
        maxTempLabel.rightAnchor.constraint(equalTo: weatherImage.leftAnchor, constant: -16).isActive = true
        weatherImage.rightAnchor.constraint(equalTo: cellHeaderContainerView.rightAnchor).isActive = true
        
        weatherImage.heightAnchor.constraint(equalToConstant: Weather_Image_Height).isActive = true
        
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.topAnchor.constraint(equalTo: cellHeaderContainerView.bottomAnchor, constant: 15.14).isActive = true
        
        separatorView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20).isActive = true
        separatorView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 16).isActive = true
        
        collectionView.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: backView.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16).isActive = true
    }
    
    //MARK: - Constants
    struct Constants {
        static let blackFontColor = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
        static let greyFontColor = UIColor(displayP3Red: 143/255, green: 150/255, blue: 161/255, alpha: 1)
        static let separatorColor = UIColor(displayP3Red: 217/255, green: 224/255, blue: 234/255, alpha: 1)
    }
    
    private let Сontent_View_Width: CGFloat = 343
    private let Content_View_Height: CGFloat = 214
    private let Data_Label_Width: CGFloat = 115
    private let Data_Label_Height: CGFloat = 28.14
    private let Min_Max_Label_Width: CGFloat = 32
    private let Min_Max_Label_Height: CGFloat = 28.14
    private let Weather_Image_Height: CGFloat = 24.12
    private let Weather_Image_Width: CGFloat = 30
    private let Header_Left_Right_Gap_To_Content_View: CGFloat = 20
    
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
