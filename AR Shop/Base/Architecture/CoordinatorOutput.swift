//
//  CoordinatorOutput.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import Foundation

protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}
