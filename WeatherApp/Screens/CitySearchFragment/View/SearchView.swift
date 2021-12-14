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

fileprivate let VIEW_HEIGHT: CGFloat = 180
fileprivate let VIEW_WIDTH: CGFloat = 343

class SearchView: UIView {

    // MARK: - Properties
    let citys = ["Тамбов", "Тюмень", "Тула", "Темрюк", "Таганрог", "Тьматараканья", "Тбилисси"]

    private weak var delegate: CitySearchDelegate!
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

    private func setupViewHierarchy() {
        self.addSubview(searchTextField)
        self.addSubview(collectionView)
        self.addSubview(cancelButton)
        self.addSubview(addButton)
    }

    private func setupLayoutConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(VIEW_HEIGHT)
            make.width.equalTo(VIEW_WIDTH)
        }

        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.snp_top).offset(BUTTONS_AND_TEXTFIELD_GAP)
            make.right.equalTo(self.snp_right).offset(-BUTTONS_AND_TEXTFIELD_GAP)
            make.left.equalTo(self.snp_left).offset(BUTTONS_AND_TEXTFIELD_GAP)
            make.height.equalTo(TEXTFIELD_HEIGHT)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp_bottom).offset(12)
            make.left.equalTo(self.snp_left).offset(BUTTONS_AND_TEXTFIELD_GAP)
            make.right.equalTo(self.snp_right)
            make.height.equalTo(COLLECTION_VIEW_HEIGHT)
        }

        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(self.snp_left).offset(BUTTONS_AND_TEXTFIELD_GAP)
            make.bottom.equalTo(self.snp_bottom).offset(-BUTTONS_AND_TEXTFIELD_GAP)
            make.height.equalTo(BUTTON_HEIGHT)
            make.width.equalTo(BUTTON_WIDTH)
        }

        addButton.snp.makeConstraints { make in
            make.right.equalTo(self.snp_right).offset(-BUTTONS_AND_TEXTFIELD_GAP)
            make.bottom.equalTo(self.snp_bottom).offset(-BUTTONS_AND_TEXTFIELD_GAP)
            make.height.equalTo(BUTTON_HEIGHT)
            make.width.equalTo(BUTTON_WIDTH)
        }
    }

    @objc private func dismissView() {
        delegate?.dismissView()
    }

    @objc private func search() {
        guard let text = searchTextField.text else {
            print(#function)
            return
        }
        delegate.search(name: text)
    }
}

// MARK: - UICollectionViewDataSource
extension SearchView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citys.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.name, for: indexPath) as? CityCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(withData: citys[indexPath.row])
        return cell
    }
}

extension SearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search()
        return true
    }
}

protocol CitySearchDelegate: AnyObject {
    func dismissView()
    func search(name: String)
}
