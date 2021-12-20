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
    private var containerView: WeatherAppContainerView<MainView> { view as! WeatherAppContainerView<MainView> }

    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    required init(with presenter: MainPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.mainViewController = self
    }
    
    override func loadView() {
        let tableView = MainView()
        guard let eventHandler = presenter as? NavigationBarEventHandler else {
            print("guard condition not met at: \(#file) \(#line) \(#function)")
            return
        }
        view = WeatherAppContainerView(withView: tableView, and: eventHandler)
    }
}

    // MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    public func provideForcastData(_ data: [Item]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                print("guard condition not met at: \(#file) \(#line) \(#function)")
                return
            }
            self.containerView.configureView(withData: data)
        }
    }
    
    public func dataReciviedForCity(_ name: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                print("guard condition not met at: \(#file) \(#line) \(#function)")
                return
            }
            self.containerView.configureNavBar(withData: name)
        }
    }
}

    // MARK: - MainPresenter protocol
protocol MainPresenter: AnyObject {
    var mainViewController: MainViewProtocol! { get set }
    var router: Router { get set }
    func recieveWeatherForCityName(_ name: String)
}
