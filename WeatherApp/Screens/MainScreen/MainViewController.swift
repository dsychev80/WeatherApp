//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit


class MainViewController: UIViewController {
    // MARK: - Properties
    public weak var presenter: MainPresenter?
    private var containerView: WeatherAppContainerView<MainView> { view as! WeatherAppContainerView<MainView> }

    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        guard let presenter = presenter, let eventHandler = presenter as? NavigationBarEventHandler else {
            fatalError("Presenter not found")
        }
        presenter.mainViewController = self
        let tableView = MainView()
        view = WeatherAppContainerView(withView: tableView, and: eventHandler)
    }
}

    // MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    public func provideForcastData(_ data: [Item], forCity name: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                fatalError("self not found")
            }
            self.containerView.configureView(withData: data)
            self.containerView.provideDataToNavBar(name)
        }
    }
}

    // MARK: - MainPresenter protocol
protocol MainPresenter: AnyObject {
    var mainViewController: MainViewProtocol! { get set }
    func recieveWeatherForCityName(_ name: String)
}
