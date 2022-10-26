//
//  CoordinatorFactoryProtocol.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func instantiateApplicationCoordinator() -> ApplicationCoordinator
    func instantiateTabBarCoordinator(router: RouterProtocol) -> MainTabBarCoordinator
    
//    func instantiateAuthCoordinator(router: RouterProtocol) -> AuthCoordinator
    func instantiateMainCoordinator(router: RouterProtocol) -> MainCoordinator
//    func instantiateBasketCoordinator(router: RouterProtocol) -> BasketCoordinator
//    func instantiateCampaignsCoordinator(router: RouterProtocol) -> CampaignsCoordinator
//    func instantiateAccountCoordinator(router: RouterProtocol) -> AccountCoordinator
    
    func makeCoordinators(routers: [RouterProtocol]) -> [Coordinator & CoordinatorFinishOutput]
    
    func makeTabbarCoordinator(router: RouterProtocol) -> (coordinator: Coordinator, toPresent: Presentable?)
    
}
