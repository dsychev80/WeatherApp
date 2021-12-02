//
//  CitySearchViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 26.11.2021.
//

import UIKit

class CitySearchViewController: UIViewController {
    
    // MARK: - Attributes
    
    private weak var cityDataDelegate: CityDataDelegate?
    private var searchTextField = WeatherCityNameTextField()
    
    private let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        return view
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: CityCollectionViewCell.name)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.CANCEL_BUTTON_COLOR
        button.layer.cornerRadius = 12
        button.titleLabel?.font = AppFont.bold.size(14)
        button.setTitleColor(Constants.CANCEL_BUTTON_TEXT_COLOR, for: .normal)
        button.setTitle("Отменить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()
    
    private var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.ADD_BUTTON_COLOR
        button.layer.cornerRadius = 12
        button.titleLabel?.font = AppFont.bold.size(14)
        button.setTitle("Добавить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(search), for: .touchUpInside)
        return button
    }()
    
    let citys = ["Тамбов", "Тюмень", "Тула", "Темрюк", "Таганрог", "Тьматараканья", "Тбилисси"]
    
    // MARK: - Lifecycle
    
    required init(with cityDataDelegate: CityDataDelegate) {
        self.cityDataDelegate = cityDataDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Constants.VIEW_BACKGROUND_COLOR
        self.definesPresentationContext = true
        
        setupViewHierarchy()
        setupLayoutConstraints()
        
        collectionView.dataSource = self
        searchTextField.delegate = self
    }
    
    // MARK: - Methods
    @objc private func search() {
        guard let cityDataDelegate = cityDataDelegate else { return }
        guard let text = searchTextField.text, text != "" else { return }
        cityDataDelegate.recievedCityName(text)
        dismissView()
    }
    
    @objc private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupViewHierarchy() {
        backView.addSubview(searchTextField)
        backView.addSubview(collectionView)
        backView.addSubview(cancelButton)
        backView.addSubview(addButton)
        view.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {
        
        backView.heightAnchor.constraint(equalToConstant: VIEW_HEIGHT).isActive = true
        backView.widthAnchor.constraint(equalToConstant: VIEW_WIDTH).isActive = true
        backView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: backView.topAnchor, constant: BUTTONS_AND_TEXTFIELD_GAP).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -BUTTONS_AND_TEXTFIELD_GAP).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: BUTTONS_AND_TEXTFIELD_GAP).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: TEXTFIELD_HEIGHT).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 12).isActive = true
        collectionView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: BUTTONS_AND_TEXTFIELD_GAP).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: COLLECTION_VIEW_HEIGHT).isActive = true
        
        cancelButton.makeConstraintsAtLeftBottomCornerView(backView,
                                                           left: BUTTONS_AND_TEXTFIELD_GAP,
                                                           bottom: BUTTONS_AND_TEXTFIELD_GAP,
                                                           height: BUTTON_HEIGHT,
                                                           width: BUTTON_WIDTH)
        addButton.makeConstraintsAtRightBottomCornerView(backView,
                                                         right: BUTTONS_AND_TEXTFIELD_GAP,
                                                         bottom: BUTTONS_AND_TEXTFIELD_GAP,
                                                         height: BUTTON_HEIGHT,
                                                         width: BUTTON_WIDTH)
    }
    
    // MARK: - Constants
    private struct Constants {
        static let VIEW_BACKGROUND_COLOR = UIColor(displayP3Red: 28/255, green: 28/255, blue: 30/255, alpha: 0.9)
        static let ADD_BUTTON_COLOR = UIColor(displayP3Red: 53/255, green: 153/255, blue: 255/255, alpha: 1)
        static let CANCEL_BUTTON_COLOR = UIColor(displayP3Red: 243/255, green: 245/255, blue: 248/255, alpha: 1)
        static let CANCEL_BUTTON_TEXT_COLOR = UIColor(displayP3Red: 112/255, green: 119/255, blue: 130/255, alpha: 1)
        static let ADD_BUTTON_TEXT_COLOR = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        static let TEXT_FIELD_BORDER_COLOR = UIColor(displayP3Red: 231/255, green: 236/255, blue: 243/255, alpha: 1)
    }
    private let VIEW_HEIGHT: CGFloat = 180
    private let VIEW_WIDTH: CGFloat = 343
    private let BUTTONS_AND_TEXTFIELD_GAP: CGFloat = 16
    private let TEXTFIELD_HEIGHT: CGFloat = 40
    private let COLLECTION_VIEW_HEIGHT: CGFloat = 30
    private let BUTTON_HEIGHT: CGFloat = 40
    private let BUTTON_WIDTH: CGFloat = 151
}

    // MARK: - UICollectionViewDataSource
extension CitySearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.name, for: indexPath) as? CityCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(withData: citys[indexPath.row])
        return cell
    }
}

extension CitySearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search()
        return true
    }
}
