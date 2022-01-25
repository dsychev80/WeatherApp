//
//  DataController.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//

import UIKit


final class MainPresenterImpl {
    // MARK: - Properties
    private let weatherSearchForCityUseCase: WeatherSearchForCityUseCase
    public var router: MainRouter!
    public weak var view: MainView!
    
    // MARK: - Lifecycle
    init(with mainInteractor: WeatherSearchForCityUseCase) {
        self.weatherSearchForCityUseCase = mainInteractor
    }
}

// MARK: - MainPresenter
extension MainPresenterImpl: MainPresenter {
    public func recieveWeatherForCityName(_ name: String) {
        view.startLoadingWeather()
        weatherSearchForCityUseCase.fetchWeatherFor(city: name) { [unowned self] result in
            switch result {
            case .failure(let error):
                view.showError(error.localizedDescription)
            case .success(let items):
                view.provideForcastData(items, forCity: name)
            }
        }
    }
}

    // MARK: - EventHandler
extension MainPresenterImpl: NavigationBarEventHandler {
    public func selectOnMap() {
        
    }
    
    public func search() {
        router.openSearchScreen { [unowned self] cityName in
            self.recieveWeatherForCityName(cityName)
        }
    }
    
    public func changeTheme() {
        
    }
}

    // MARK: - MainView
protocol MainView: UIViewController {
    func startLoadingWeather()
    func provideForcastData(_ data: [Item], forCity name: String)
    func showError(_ text: String)
}
