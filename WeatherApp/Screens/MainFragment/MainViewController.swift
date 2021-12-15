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
    private var containerView: NavigationContainerView<MainTableView> { view as! NavigationContainerView<MainTableView> }

    
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

        presenter?.recieveWeatherForCityName("Tambov")
    }
    
    override func loadView() {
        let tableView = MainTableView()
        view = NavigationContainerView(withView: tableView, and: self as EventHandler)
    }
    
    // MARK: - Methods
    public func provideForcastData(_ data: [Item]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.containerView.configureView(withData: data)
        }
    }
}

extension MainViewController: MainView {
    func dataReciviedForCity(_ name: String) {
        DispatchQueue.main.async { [weak self] in
            self?.containerView.configureNavBar(withData: name)
        }
    }
}

extension MainViewController: CityDataDelegate {
    func searchCityWithName(_ name: String) {
        guard let presenter = presenter else { return }
        presenter.recieveWeatherForCityName(name)
    }
}

extension MainViewController: EventHandler {
    @objc func selectOnMap() {
        let searchVC = CitySearchViewController(with: self)
        searchVC.modalPresentationStyle = .overCurrentContext
        searchVC.modalTransitionStyle = .crossDissolve
        present(searchVC, animated: true, completion: nil)
    }
    
    @objc func search() {
        print("search")
    }
    
    @objc func changeTheme() {
        print("change theme")
    }
}

protocol MainPresenter: AnyObject {
    var mainViewController: MainView! { get set }
    func recieveWeatherForCityName(_ name: String)
}

protocol ContainerView: UIView {
    associatedtype NavigationBarTypeModel
    associatedtype ContainedViewTypeModel
    
    func provideDataToNavBar(_ data: NavigationBarTypeModel)
    func provideDataToContainedView(_ data: ContainedViewTypeModel)
}
