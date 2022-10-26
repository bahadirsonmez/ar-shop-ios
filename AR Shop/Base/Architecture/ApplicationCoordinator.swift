//
//  ApplicationCoordinator.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Vars & Lets
    private let factory: Factory
    private let router: RouterProtocol
    private var launchInstructor: LaunchInstructor
    
    //MARK: - Coordinator
    
    override func start() {
        switch launchInstructor {
        case .onboarding: runAuthFlow() // runAuthFlow
        case .auth: runAuthFlow() // runAuthFlow
        case .main: runMainFlow()
        }
    }
    
    // MARK: - Private methods
    private func runAuthFlow() {
//        let coordinator = self.factory.instantiateAuthCoordinator(router: self.router)
//        coordinator.finishFlow = { [unowned self, unowned coordinator] in
//            self.removeDependency(coordinator)
//            self.launchInstructor = LaunchInstructor.configure()
//            self.start()
//        }
//        self.addDependency(coordinator)
//        coordinator.start()
    }
    
    public func reboot() {
        let coordinator = self.factory.instantiateTabBarCoordinator(router: self.router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }

    private func runMainFlow() {
        let coordinator = self.factory.instantiateTabBarCoordinator(router: self.router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    // MARK: - Init
    init(router: RouterProtocol, factory: Factory, launchInstructor: LaunchInstructor) {
        self.router = router
        self.factory = factory
        self.launchInstructor = launchInstructor
    }
}
