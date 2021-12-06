//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit


class MainViewController: UIViewController {
    // MARK: - Properties
    private weak var presenter: MainPresenter?
    private var tableView: MainTableView!
    private var mainWeatherDataSourceAdapter = MainWeatherAdapter()
    
    // MARK: - Lifecycle
    
    required init(with presenter: MainPresenter) {
        self.presenter = presenter
        self.tableView = MainTableView(with: mainWeatherDataSourceAdapter)
        super.init(nibName: nil, bundle: nil)
        presenter.mainViewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        setupViewHierarchy()
        setupLayoutConstraints()
        customizeNavigationBar()
    }
    
    // MARK: - Methods
    public func provideForcastData(_ data: JSONWeatherData) {
        mainWeatherDataSourceAdapter.getForecast(data)
    }
    
    private func setupViewHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayoutConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // FIXME: - need to move this code
    private func customizeNavigationBar() {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.titleTextAttributes = [
            .font: AppFont.extraBold.size(18),
            .foregroundColor: TITLE_COLOR
        ]
        
        let pointButton = UIButton()
        pointButton.addTarget(self, action: #selector(selectOnMap), for: .touchUpInside)
        pointButton.setImage(UIImage(named: "Point"), for: .normal)
        
        let searchButton = UIButton()
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        searchButton.setImage(UIImage(named: "Search"), for: .normal)
        
        let themeButton = UIButton()
        themeButton.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
        themeButton.setImage(UIImage(named: "Theme"), for: .normal)
        
        let mapPointItem = UIBarButtonItem(customView: pointButton)
        let searchItem = UIBarButtonItem(customView: searchButton)
        let themeItem = UIBarButtonItem(customView: themeButton)
        
        navigationItem.leftBarButtonItem = mapPointItem
        navigationItem.rightBarButtonItems = [searchItem, themeItem]
    }
    
    @objc private func search() {
        print("search")
    }
    
    @objc private func changeTheme() {
        print("change theme")
    }
    
    @objc private func selectOnMap() {
        guard let presenter = presenter else { return }
        let searchVC = CitySearchViewController(with: presenter)
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        present(searchVC, animated: true, completion: nil)
    }
    
    // MARK: - Constants
    private let TITLE_COLOR = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
}

extension MainViewController: MainDataRecivier {
    func dataReciviedForCity(_ name: String) {
        self.title = name
        self.tableView.reloadData()
    }
}

protocol CityDataDelegate: AnyObject {
    func recievedCityName(_ name: String)
}
