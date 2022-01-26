//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Denis Sychev on 28.11.2021.
//
import NeedleFoundation
import UIKit


final class AppCoordinator: BootstrapComponent {
    // MARK: - Properties
    var navigationController: UINavigationController {
        return shared { UINavigationController() }
    }
    
    var networkService: NetworkService {
        return NetworkServiceImpl()
    }
    
    var locationService: LocationService {
        return LocationManagerImpl()
    }
    
    var router: MainRouterComponent {
        return MainRouterComponent(parent: self)
    }
    
    var mainScreenComponent: MainScreenBuilder {
        return MainScreenDependencyComponent(parent: self)
    }
    
    var searchScreenComponent: SearchScreenBuilder {
        return SearchScreenDependencyComponent(parent: self)
    }
    
    
    // MARK: - Lifecycle
    override init() {
        // Needle 
        registerProviderFactories()
        super.init()
    }
    
    public func startApplicationInWindow(_ window: UIWindow?) {
        guard let window = window else {
            fatalError("There is no window")
        }
        
        router.mainRouter.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

protocol MainRouter: AnyObject {
    func start()
    func openSearchScreen(withCompletion completion: @escaping (String) -> Void)
    func popToRoot()
}
