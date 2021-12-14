//
//  CustomNavigationController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 14.12.2021.
//

import UIKit

class CustomNavigationController: UIViewController {

    // MARK: - Properties
    private var customView: CustomNavigationView { view as! CustomNavigationView }
    
    private var rootViewController: UIViewController
    
    // MARK: - LifeCycle
    required init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = CustomNavigationView(withView: rootViewController.view)
    }
    
    // MARK: - Methods
}
