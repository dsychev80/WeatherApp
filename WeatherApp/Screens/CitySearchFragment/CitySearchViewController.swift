//
//  CitySearchViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 26.11.2021.
//

import UIKit

class CitySearchViewController: UIViewController {
    
    // MARK: - Properties
    
    private weak var cityDataDelegate: CityDataDelegate?
    
    lazy private var backView: BackView = BackView(withDelegate: self)
    
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

        view.backgroundColor = CitySearchViewController.VIEW_BACKGROUND_COLOR
        self.definesPresentationContext = true
        
        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    // MARK: - Methods
    private func setupViewHierarchy() {
        view.addSubview(backView)
    }
    
    private func setupLayoutConstraints() {

        backView.heightAnchor.constraint(equalToConstant: VIEW_HEIGHT).isActive = true
        backView.widthAnchor.constraint(equalToConstant: VIEW_WIDTH).isActive = true
        backView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    // MARK: - Constants
    static private let VIEW_BACKGROUND_COLOR = UIColor(displayP3Red: 28/255, green: 28/255, blue: 30/255, alpha: 0.9)
        
    private let VIEW_HEIGHT: CGFloat = 180
    private let VIEW_WIDTH: CGFloat = 343
}

extension CitySearchViewController: CitySearchDelegate {
    public func search(name: String) {
        guard let cityDataDelegate = cityDataDelegate else { return }
        cityDataDelegate.recievedCityName(name)
        dismissView()
    }
    
     public func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
}
