//
//  CitySearchViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 26.11.2021.
//

import UIKit


class CitySearchViewController: UIViewController, CitySearchView {
    // MARK: - Properties
    private var backView: SearchBackView { view as! SearchBackView }
    var presenter: CitySearchPresenter
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(with presenter: CitySearchPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.searchViewController = self
    }
    
    override func loadView() {
        view = SearchBackView(withDelegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        
        getCities()
    }
    
    // MARK: - Methods    
    public func getCities() {
        let cities = presenter.provideCities()
        backView.provideCitiesData(cities)
    }
}

// MARK: - CitySearchDelegate
extension CitySearchViewController: CitySearchDelegate {
    public func dismissView() {
        dismiss(animated: true)
        presenter.dismiss()
    }
    
    public func search(name: String) {
        presenter.searchCityWithName(name)
    }
}

protocol CitySearchView: AnyObject {
    var presenter: CitySearchPresenter { get set }
    func getCities()
}

protocol CitySearchPresenter: AnyObject {
    var searchViewController: CitySearchView! { get set }
    var router: MainRouter { get set }
    func searchCityWithName(_ name: String)
    func provideCities() -> [String]
    func dismiss()
}
