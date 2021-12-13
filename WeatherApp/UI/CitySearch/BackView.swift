//
//  BackView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 06.12.2021.
//

import UIKit

// MARK: - Constants
fileprivate let BUTTONS_AND_TEXTFIELD_GAP: CGFloat = 16
fileprivate let TEXTFIELD_HEIGHT: CGFloat = 40
fileprivate let COLLECTION_VIEW_HEIGHT: CGFloat = 30
fileprivate let BUTTON_HEIGHT: CGFloat = 40
fileprivate let BUTTON_WIDTH: CGFloat = 151

class BackView: UIView {

    // MARK: - Properties
    let citys = ["Тамбов", "Тюмень", "Тула", "Темрюк", "Таганрог", "Тьматараканья", "Тбилисси"]

    private weak var delegate: CitySearchDelegate?
    
    private var searchTextField = WeatherCityNameTextField()
    private var collectionView = CitysCollectionView()
    private var cancelButton = SityCancelButton(withTarget: self, selector: #selector(dismissView))
    private var addButton = CitySearchAddButton(withTarget: self, selector: #selector(search))
    
    // MARK: - LifeCycle
    required init(withDelegate delegate: CitySearchDelegate) {
    self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.layer.cornerRadius = 24
        self.clipsToBounds = true
        
        searchTextField.delegate = self
        collectionView.dataSource = self
        
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    @objc private func dismissView() {
        delegate?.dismissView()
    }
    
    @objc private func search() {
        guard let delegate = delegate, let text = searchTextField.text else {
            print(#function)
            return
        }
        delegate.search(name: text)
    }
    
    private func setupViewHierarchy() {
        self.addSubview(searchTextField)
        self.addSubview(collectionView)
        self.addSubview(cancelButton)
        self.addSubview(addButton)
    }
    
    private func setupLayoutConstraints() {
        
        searchTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: BUTTONS_AND_TEXTFIELD_GAP).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -BUTTONS_AND_TEXTFIELD_GAP).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: BUTTONS_AND_TEXTFIELD_GAP).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: TEXTFIELD_HEIGHT).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 12).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: BUTTONS_AND_TEXTFIELD_GAP).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: COLLECTION_VIEW_HEIGHT).isActive = true
        
        cancelButton.makeConstraintsAtLeftBottomCornerView(self,
                                                           left: BUTTONS_AND_TEXTFIELD_GAP,
                                                           bottom: BUTTONS_AND_TEXTFIELD_GAP,
                                                           height: BUTTON_HEIGHT,
                                                           width: BUTTON_WIDTH)
        addButton.makeConstraintsAtRightBottomCornerView(self,
                                                         right: BUTTONS_AND_TEXTFIELD_GAP,
                                                         bottom: BUTTONS_AND_TEXTFIELD_GAP,
                                                         height: BUTTON_HEIGHT,
                                                         width: BUTTON_WIDTH)
    }
}

// MARK: - UICollectionViewDataSource
extension BackView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citys.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.name, for: indexPath) as? CityCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(withData: citys[indexPath.row])
        return cell
    }
}

extension BackView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search()
        return true
    }
}

protocol CitySearchDelegate: AnyObject {
    func dismissView()
    func search(name: String)
}
