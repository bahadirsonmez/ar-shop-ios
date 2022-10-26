//
//  CategoriesCoordinator.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 13.01.2022.
//

import UIKit

final class CategoriesCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
      
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let factory: Factory
    private let controller: CategoriesViewController
    
    override func start() {
        showAccountModule()
    }
    
    // MARK: - Private metods
    private func showAccountModule() {
        controller.tabBarController?.selectedIndex = 1
    }
    
    init(controller: CategoriesViewController, router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
        self.controller = controller
    }
}
