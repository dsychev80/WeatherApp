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
    private var navigationController: UINavigationController
    private var networkController: NetworkManager
    var locationManager: LocationManager
    var router: MainRouter
    var mainScreenComponent: MainScreenDIContainer
    
    
    // MARK: - Lifecycle
    override init() {
        // Needle 
        registerProviderFactories()
        self.navigationController = UINavigationController()
        self.networkController = NetworkProvider()
        self.locationManager = LocationManagerImpl()
        self.mainScreenComponent = MainScreenDIContainer(with: networkController, locationManager: locationManager)
        self.router = MainRouterImpl(with: self.navigationController, mainScreenDIContainer: self.mainScreenComponent)
        super.init()
    }
    
    public func startApplicationInWindow(_ window: UIWindow?) {
        guard let window = window else {
            fatalError("There is no window")
        }
        router.start()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

protocol MainRouter: AnyObject {
    func start()
    func openSearchScreen(withCompletion completion: @escaping (String) -> Void)
    func popToRoot()
}
