//
//  CitySearchViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 26.11.2021.
//

import UIKit


class CitySearchViewController: UIViewController {
    // MARK: - Properties
    private var backView: SearchBackView { view as! SearchBackView }
    
    // MARK: - Lifecycle
    required init() {
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
        
        // FIXME: - For demonstraition purpose only
        provideCities()
    }
    
    // MARK: - Methods
    public func provideCities() {
        let cities = ["Тамбов", "Тюмень", "Тула", "Темрюк", "Таганрог", "Тьматараканья", "Тбилисси"]
        backView.provideCitiesData(cities)
    }
}

// MARK: - CitySearchDelegate
extension CitySearchViewController: CitySearchDelegate {
    public func dismissView() {
        self.navigationController?.dismiss(animated: true, completion: {
            self.navigationController?.popViewController(animated: true)
        })
        self.dismiss(animated: true, completion: nil)
    }
    
    public func search(name: String) {
//        cityDataDelegate.searchCityWithName(name)
        dismissView()
    }
}

protocol CityDataDelegate: AnyObject {
    func searchCityWithName(_ name: String)
}
