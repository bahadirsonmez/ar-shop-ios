//
//  MainCoordinator.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import UIKit

final class MainCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
      
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let factory: Factory
    private let controller: MainViewController
    
    override func start() {
        showAccountModule()
    }
    
    // MARK: - Private metods
    private func showAccountModule() {
        controller.tabBarController?.selectedIndex = 0
        controller.onFaceView = { [weak self] product in
            guard let product = product else { return }
            self?.showOnFaceView(with: product)
        }
    }
    
    init(controller: MainViewController, router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
        self.controller = controller
    }
    
    private func showOnFaceView(with product: ProductItemModel) {
        let vc = self.factory.instantiateOnFaceViewController()
        vc.item = product
        vc.onBack = {
            self.router.popModule(transition: self.animator)
        }
        self.router.push(vc, transition: animator)
    }
    
//    private func showPayment() {
//        let vc = self.factory.instantiatePaymentViewController()
//        vc.onBack = {
//            self.router.popModule()
//        }
//        vc.onConfirmation = {
//            self.showDelivery()
//        }
//        self.router.push(vc, transition: FadeAnimator(animationDuration: 0.3,
//                                                      isPresenting: true))
//    }

}
