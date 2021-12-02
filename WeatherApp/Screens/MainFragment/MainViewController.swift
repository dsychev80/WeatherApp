//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit

protocol MainDataRecivier: AnyObject {
    func dataReciviedForCity(_ name: String)
}

class MainViewController: UIViewController {
    
    private struct Constants {
        static let titleColor = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
    }
    
    // MARK: - Attributes
    
    private let dataController: MainPresenter
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CurrentDayCell.self, forCellReuseIdentifier: CurrentDayCell.name)
        table.register(RecentDayCell.self, forCellReuseIdentifier: RecentDayCell.name)
        return table
    }()
    
    // MARK: - Lifecycle
    
    required init(with dataController: MainPresenter) {
        self.dataController = dataController
        
        super.init(nibName: nil, bundle: nil)
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
        
        dataController.dataRecivier = self
        tableView.dataSource = dataController
    }
    
    // MARK: - Methods
    
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
            .foregroundColor: Constants.titleColor
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
        let searchVC = CitySearchViewController(with: dataController as CityDataDelegate)
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        present(searchVC, animated: true, completion: nil)
    }
}

extension MainViewController: MainDataRecivier {
    func dataReciviedForCity(_ name: String) {
        self.title = name
        self.tableView.reloadData()
    }
}
