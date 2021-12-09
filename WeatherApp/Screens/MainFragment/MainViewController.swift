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
    private var tableView: MainTableView { view as! MainTableView }
    private var mainWeatherDataSourceAdapter = MainWeatherAdapter()
    private var dataSource: UITableViewDiffableDataSource<Int, Item>!
    
    // MARK: - Lifecycle
    
    required init(with presenter: MainPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.mainViewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        customizeNavigationBar()
    }
    
    override func loadView() {
        view = MainTableView(with: mainWeatherDataSourceAdapter)
        dataSource = UITableViewDiffableDataSource<Int, Item>(tableView: tableView) {
            (tableView: UITableView, indexPath: IndexPath, item: Item) -> UITableViewCell? in
            switch item {
            case .today(let todayData):
                let cell = tableView.dequeueReusableCell(withIdentifier: TodayCell.name, for: indexPath) as! TodayCell
                cell.configure(with: todayData)
                return cell
            case .forecast(let forecastData):
                let cell = tableView.dequeueReusableCell(withIdentifier: RecentDayCell.name, for: indexPath) as! RecentDayCell
                cell.configure(with: forecastData)
                return cell
            }
        }
        tableView.dataSource = dataSource
    }
    
    // MARK: - Methods
    public func provideForcastData(_ data: JSONWeatherData) {
        DispatchQueue.main.async { [weak self] in
            var snapshot = NSDiffableDataSourceSnapshot<Int, Item>()
            guard  let todayWeather = data.returnTodayWeather()
                    else { return }
            let dayWeatherItem = Item.today(todayWeather)
            var forcast = data.convertToForecastByDay()
                .map { Item.forecast($0) }
            forcast.insert(dayWeatherItem, at: 0)
            snapshot.appendSections([0])
            snapshot.appendItems(forcast, toSection: 0)
            
            self?.dataSource.apply(snapshot)
        }
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

extension MainViewController: MainView {
    func dataReciviedForCity(_ name: String) {
        DispatchQueue.main.async { [weak self] in
            self?.title = name
            self?.tableView.reloadData()
        }
    }
}

protocol CityDataDelegate: AnyObject {
    func recievedCityName(_ name: String)
}
