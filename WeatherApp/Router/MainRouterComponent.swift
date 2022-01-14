//
//  MainRouterComponent.swift
//  WeatherApp
//
//  Created by Denis Sychev on 12.01.2022.
//

import NeedleFoundation
import UIKit

protocol MainRouterDependency: Dependency {
    var navigationController: UINavigationController { get }
    var mainScreenComponent: MainScreenBuilder { get }
    var searchScreenComponent: SearchScreenBuilder { get }
}

final class MainRouterComponent: Component<MainRouterDependency> {
    
    var mainRouter: MainRouter {
        return MainRouterImpl(with: dependency.navigationController, mainScreenBuilder: dependency.mainScreenComponent, searchScreenBuilder: dependency.searchScreenComponent)
    }
    
    var searchScreenComponent: SearchScreenDependencyComponent {
        return SearchScreenDependencyComponent(parent: self)
    }

    var mainScreenComponent: MainScreenDependencyComponent {
        return MainScreenDependencyComponent(parent: self)
    }
}
