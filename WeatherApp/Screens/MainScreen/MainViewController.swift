//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.11.2021.
//

import UIKit


class MainViewController: UIViewController {
    // MARK: - Properties
    public var presenter: MainPresenter?
    private var containerView: WeatherAppContainerView<MainViewImpl> { view as! WeatherAppContainerView<MainViewImpl> }

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
        presenter.view = self
        let tableView = MainViewImpl()
        view = WeatherAppContainerView(withView: tableView, and: eventHandler)
    }
}

    // MARK: - MainView
extension MainViewController: MainView {
    func startLoadingWeather() {
        containerView.startLoading()
    }
    
    public func provideForcastData(_ data: [Item], forCity name: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                fatalError("self not found")
            }
            self.containerView.configureView(withData: data, andBarTitle: name)
            self.containerView.stopLoading()
        }
    }
}

    // MARK: - MainPresenter protocol
protocol MainPresenter: AnyObject {
    var view: MainView! { get set }
    func recieveWeatherForCityName(_ name: String)
}
