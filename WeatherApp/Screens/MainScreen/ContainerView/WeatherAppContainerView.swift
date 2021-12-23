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
    private var activityIndicator: UIActivityIndicatorView
    private var errorView: ErrorView
    
    // MARK: - LifeCycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(withView view: ContainedView, and eventHandler: NavigationBarEventHandler) {
        navigationBar = NavigationBar(with: eventHandler)
        containedView = view
        activityIndicator = UIActivityIndicatorView(frame: .zero)
        errorView = ErrorView()
        super.init(frame: .zero)
        setup()
    }
    
    // MARK: - Methods
    private func setup() {
        self.backgroundColor = .white
        errorView.isHidden = true
        setupLayout()
        setupAcivityIndicator()
    }
    
    private func setupLayout() {
        self.addSubview(containedView)
        containedView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_top)
            make.left.equalTo(self.snp_left)
            make.bottom.equalTo(self.snp_bottom)
            make.right.equalTo(self.snp_right)
        }
        
        self.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        self.addSubview(errorView)
        errorView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        self.addSubview(navigationBar)
    }
    
    private func setupAcivityIndicator() {
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
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
    
    public func startLoading() {
        activityIndicator.startAnimating()
        containedView.isHidden = true
        errorView.isHidden = true
    }
    
    public func stopLoading() {
        activityIndicator.stopAnimating()
        containedView.isHidden = false
    }
    
    public func showError(_ text: String) {
        errorView.isHidden = false
        errorView.showErrorText(text)
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

    func startLoading()
    func stopLoading()
    func showError(_ text: String)
    func provideDataToContainedView(_ data: ContainedViewTypeModel, andBarData barData: NavigationBarTypeModel)
}

