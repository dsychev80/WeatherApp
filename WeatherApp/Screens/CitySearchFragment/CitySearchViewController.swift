//
//  CitySearchViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 26.11.2021.
//

import UIKit


class CitySearchViewController: UIViewController {
    // MARK: - Properties
    
    private weak var cityDataDelegate: CityDataDelegate!
    private var backView: SearchBackView { view as! SearchBackView }
    
    // MARK: - Lifecycle
    required init(with cityDataDelegate: CityDataDelegate) {
        self.cityDataDelegate = cityDataDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = SearchBackView(withDelegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
    }
    
    // MARK: - Methods
}

extension CitySearchViewController: CitySearchDelegate {
    public func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func search(name: String) {
        cityDataDelegate.searchCityWithName(name)
        dismissView()
    }
}

protocol CityDataDelegate: AnyObject {
    func searchCityWithName(_ name: String)
}
