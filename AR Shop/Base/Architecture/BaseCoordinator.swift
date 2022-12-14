//
//  BaseCoordinator.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import Foundation
import UIKit

class BaseCoordinator: NSObject, Coordinator {
    
    // MARK: - Vars & Lets
    let animator = FadeAnimator(animationDuration: 0.3, isPresenting: true)
    var childCoordinators = [Coordinator]()
    
    // MARK: - Public methods
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // MARK: - Coordinator
    
    func start() {
        start()
    }
}
