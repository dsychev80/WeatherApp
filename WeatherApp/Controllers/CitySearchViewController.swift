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
        
        static let viewHeight: CGFloat = 180
        static let viewWidth: CGFloat = 343
        
        static let buttonsAndTextFieldGap: CGFloat = 16
        
        static let textFieldHeight: CGFloat = 40
        
        static let collectionViewHeight: CGFloat = 24
        
        static let buttonHeight: CGFloat = 40
        static let buttonWidth: CGFloat = 151
    }

    // MARK: - Attributes
    private let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        return view
    }()
    
    private var searchTextField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: UIImage(named: "textSearch"))
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
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
    
    let citys = ["Тамбов", "Тюмень", "Тула", "Темрюк", "Таганрог"]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Constants.viewBackgroundColor
        self.definesPresentationContext = true
        
        setupViewHierarchy()
        setupLayoutConstraints()
        
        collectionView.dataSource = self
    }
    
    // MARK: - Methods
    @objc private func search() {
        // search code here
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
