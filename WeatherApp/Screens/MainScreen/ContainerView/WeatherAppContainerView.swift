//
//  WeatherAppContainerView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 14.12.2021.
//

import UIKit


class WeatherAppContainerView<ContainedView: ContentView>: UIView {
    // MARK: - Properties
    private var navigationBar: NavigationBar
    private var containedView: ContainedView
    
    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(withView view: ContainedView, and eventHandler: NavigationBarEventHandler) {
        navigationBar = NavigationBar(with: eventHandler)
        containedView = view
        super.init(frame: .zero)
        setup()
    }
    
    // MARK: - Methods
    private func setup() {

        setupLayout()
    }
    
    private func setupLayout() {
        self.addSubview(containedView)
        containedView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_top)
            make.left.equalTo(self.snp_left)
            make.bottom.equalTo(self.snp_bottom)
            make.right.equalTo(self.snp_right)
        }
        
        self.addSubview(navigationBar)
    }
    
    public func configureView(withData data: ContainedView.ModelType, andBarTitle title: String) {
        containedView.configure(with: data)
        navigationBar.setTitle(with: title)
    }
}

extension WeatherAppContainerView: ContainerView {
    typealias NavigationBarTypeModel = String
    typealias ContainedViewTypeModel = ContainedView.ModelType
    
    func provideDataToContainedView(_ data: ContainedView.ModelType, andBarData barData: String) {
        configureView(withData: data, andBarTitle: barData)
    }
}

protocol ContentView: UIView {
    associatedtype ModelType
    func configure(with data: ModelType)
}

// MARK: - ContainerView protocol
protocol ContainerView: UIView {
    associatedtype NavigationBarTypeModel
    associatedtype ContainedViewTypeModel

    func provideDataToContainedView(_ data: ContainedViewTypeModel, andBarData barData: NavigationBarTypeModel)
}

