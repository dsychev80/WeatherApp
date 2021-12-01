//
//  CitySearchViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 26.11.2021.
//

import UIKit

class CitySearchViewController: UIViewController {
    
    // MARK: - Constants
    
    private struct Constants {
        static let viewBackgroundColor = UIColor(displayP3Red: 28/255, green: 28/255, blue: 30/255, alpha: 0.9)
        static let addButtonColor = UIColor(displayP3Red: 53/255, green: 153/255, blue: 255/255, alpha: 1)
        static let cancelButtonColor = UIColor(displayP3Red: 243/255, green: 245/255, blue: 248/255, alpha: 1)
        static let cancelButtonTextColor = UIColor(displayP3Red: 112/255, green: 119/255, blue: 130/255, alpha: 1)
        static let addButtonTextColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        static let textFieldBorderColor = UIColor(displayP3Red: 231/255, green: 236/255, blue: 243/255, alpha: 1)
        
        static let viewHeight: CGFloat = 180
        static let viewWidth: CGFloat = 343
        
        static let buttonsAndTextFieldGap: CGFloat = 16
        
        static let textFieldHeight: CGFloat = 40
        
        static let collectionViewHeight: CGFloat = 30
        
        static let buttonHeight: CGFloat = 40
        static let buttonWidth: CGFloat = 151
    }

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
    
//    private var searchTextField: UITextField = {
//        let textField = WeatherCityNameTextField(withInsets: 8, left: 40, bottom: 8, right: 14)
//        textField.layer.borderWidth = 1
//        textField.layer.borderColor = Constants.textFieldBorderColor.cgColor
//        textField.layer.cornerRadius = 12
//        textField.leftView = UIImageView(image: UIImage(named: "textSearch"))
//        textField.rightView = UIImageView(image: UIImage(named: "Plus"))
//        textField.rightViewMode = .whileEditing
//        textField.leftViewMode = .always
//        textField.borderStyle = .none
//        textField.clearButtonMode = .whileEditing
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
    
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
        button.backgroundColor = Constants.cancelButtonColor
        button.layer.cornerRadius = 12
        button.titleLabel?.font = AppFont.bold.size(14)
        button.setTitleColor(Constants.cancelButtonTextColor, for: .normal)
        button.setTitle("Отменить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return button
    }()
    
    private var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.addButtonColor
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

        view.backgroundColor = Constants.viewBackgroundColor
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
        
        backView.heightAnchor.constraint(equalToConstant: Constants.viewHeight).isActive = true
        backView.widthAnchor.constraint(equalToConstant: Constants.viewWidth).isActive = true
        backView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: backView.topAnchor, constant: Constants.buttonsAndTextFieldGap).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -Constants.buttonsAndTextFieldGap).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: Constants.buttonsAndTextFieldGap).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 12).isActive = true
        collectionView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: Constants.buttonsAndTextFieldGap).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: Constants.collectionViewHeight).isActive = true
        
        cancelButton.makeConstraintsAtLeftBottomCornerView(backView, left: Constants.buttonsAndTextFieldGap, bottom: Constants.buttonsAndTextFieldGap, height: Constants.buttonHeight, width: Constants.buttonWidth)
        addButton.makeConstraintsAtRightBottomCornerView(backView, right: Constants.buttonsAndTextFieldGap, bottom: Constants.buttonsAndTextFieldGap, height: Constants.buttonHeight, width: Constants.buttonWidth)
    }
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
