//
//  SearchScreenDIContainer.swift
//  WeatherApp
//
//  Created by Denis Sychev on 22.12.2021.
//

import Foundation

class SearchScreenDIContainer {
    public let presenter: CitySearchPresenter
    
    init(with di: DIContainer) {
        self.presenter = CitySearchPresenterImpl(with: di.mainRouter)
    }
}
