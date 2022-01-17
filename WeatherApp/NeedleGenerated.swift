

import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppCoordinator") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppCoordinator->MainScreenDependencyComponent") { component in
        return MainScreenDependencyb56da4ea76a04f5a4c48Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppCoordinator->MainRouterComponent->MainScreenDependencyComponent") { component in
        return MainScreenDependency09a2759eede225e479beProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppCoordinator->SearchScreenDependencyComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppCoordinator->MainRouterComponent->SearchScreenDependencyComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->AppCoordinator->MainRouterComponent") { component in
        return MainRouterDependencyf3c7a26f8112e205f0b6Provider(component: component)
    }
    
}

// MARK: - Providers

private class MainScreenDependencyb56da4ea76a04f5a4c48BaseProvider: MainScreenDependency {
    var networkController: NetworkManager {
        return appCoordinator.networkController
    }
    var locationManager: LocationManager {
        return appCoordinator.locationManager
    }
    private let appCoordinator: AppCoordinator
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
}
/// ^->AppCoordinator->MainScreenDependencyComponent
private class MainScreenDependencyb56da4ea76a04f5a4c48Provider: MainScreenDependencyb56da4ea76a04f5a4c48BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appCoordinator: component.parent as! AppCoordinator)
    }
}
/// ^->AppCoordinator->MainRouterComponent->MainScreenDependencyComponent
private class MainScreenDependency09a2759eede225e479beProvider: MainScreenDependencyb56da4ea76a04f5a4c48BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appCoordinator: component.parent.parent as! AppCoordinator)
    }
}
private class MainRouterDependencyf3c7a26f8112e205f0b6BaseProvider: MainRouterDependency {
    var navigationController: UINavigationController {
        return appCoordinator.navigationController
    }
    var mainScreenComponent: MainScreenBuilder {
        return appCoordinator.mainScreenComponent
    }
    var searchScreenComponent: SearchScreenBuilder {
        return appCoordinator.searchScreenComponent
    }
    private let appCoordinator: AppCoordinator
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
}
/// ^->AppCoordinator->MainRouterComponent
private class MainRouterDependencyf3c7a26f8112e205f0b6Provider: MainRouterDependencyf3c7a26f8112e205f0b6BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(appCoordinator: component.parent as! AppCoordinator)
    }
}
