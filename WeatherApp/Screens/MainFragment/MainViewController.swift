//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit


class MainViewController: UIViewController {
    // MARK: - Properties
    private var presenter: MainPresenter?
    private var containerView: WeatherAppContainerView<MainTableView> { view as! WeatherAppContainerView<MainTableView> }

    
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
        guard let eventHandler = presenter as? EventHandler else { return }
        view = WeatherAppContainerView(withView: tableView, and: eventHandler)
    }
    
    // MARK: - Methods
    public func provideForcastData(_ data: [Item]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.containerView.configureView(withData: data)
        }
    }
}

    // MARK: - MainView
extension MainViewController: MainView {
    func dataReciviedForCity(_ name: String) {
        DispatchQueue.main.async { [weak self] in
            self?.containerView.configureNavBar(withData: name)
        }
    }
}

    // MARK: - CityDataDelegate
extension MainViewController: CityDataDelegate {
    func searchCityWithName(_ name: String) {
        guard let presenter = presenter else { return }
        presenter.recieveWeatherForCityName(name)
    }
}

    // MARK: - MainPresenter protocol
protocol MainPresenter: AnyObject {
    var mainViewController: MainView! { get set }
    var router: Router { get set }
    func recieveWeatherForCityName(_ name: String)
}

    // MARK: - ContainerView protocol
protocol ContainerView: UIView {
    associatedtype NavigationBarTypeModel
    associatedtype ContainedViewTypeModel
    
    func provideDataToNavBar(_ data: NavigationBarTypeModel)
    func provideDataToContainedView(_ data: ContainedViewTypeModel)
}
