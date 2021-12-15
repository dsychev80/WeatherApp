//
//  NavigationContainerView.swift
//  WeatherApp
//
//  Created by Denis Sychev on 14.12.2021.
//

import UIKit

protocol Model {}

protocol ContentView: UIView {
    associatedtype ModelType = Model
    func configureWithData(_ data: Model)
}

class NavigationContainerView<ContainedView: ContentView>: UIView {
    typealias ViewType = ContainedView
    
    // MARK: - Properties
    private var navigationBar: NavigationBar
    private var containedView: ViewType
    
    // MARK: - LifeCycle
    required init(withView view: ContainedView) {
        navigationBar = NavigationBar()
        containedView = view
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setup() {

        setupViewHierarchy()
        setupLayoutConstraints()
    }
    
    private func setupViewHierarchy() {
        self.addSubview(containedView)
        self.addSubview(navigationBar)
    }
    
    private func setupLayoutConstraints() {
        containedView.snp.makeConstraints { make in
            make.top.equalTo(self.snp_top)
            make.left.equalTo(self.snp_left)
            make.bottom.equalTo(self.snp_bottom)
            make.right.equalTo(self.snp_right)
        }
    }
    
    public func configureNavBar(withData data: String) {
        navigationBar.configure(withData: data)
    }
    
    public func configureView(withData data: ContainedView.ModelType) {
        containedView.configureWithData(data as! Model)
    }
}

extension NavigationContainerView: ContainerView {
    typealias NavigationBarTypeModel = String
    typealias ContainedViewTypeModel = ContainedView.ModelType
    
    func provideDataToNavBar(_ data: String) {
        configureNavBar(withData: data)
    }
    
    func provideDataToContainedView(_ data: ContainedView.ModelType) {
        configureView(withData: data)
    }
}
