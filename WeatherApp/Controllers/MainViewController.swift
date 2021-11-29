//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private struct Constants {
        static let titleColor = UIColor(displayP3Red: 42/255, green: 45/255, blue: 51/255, alpha: 1)
    }
    
    // MARK: - Attributes

    private let dataController: DataController
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - Lifecycle
    required init(with dataController: DataController) {
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
        
        tableView.dataSource = self
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
    
    private func customizeNavigationBar() {
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.titleTextAttributes = [
            .font: AppFont.extraBold.size(18),
            .foregroundColor: Constants.titleColor
        ]
        
        // FIXME: - Default data, need to delete after creating model.
        self.title = "Тамбов"
        
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
        print("map")
        let searchVC = CitySearchViewController(with: dataController as CityDataDelegate)
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        present(searchVC, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let currentDayCell = CurrentDayCellTableViewCell(style: .default, reuseIdentifier: CurrentDayCellTableViewCell.name)
            return currentDayCell
        }
        
        return RecentDayTableViewCell()
    }
}
