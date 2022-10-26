//
//  CategoriesViewModel.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 13.01.2022.
//

import Foundation

class CategoriesViewModel: NSObject {
    let manager: CategoriesAPIManager
    
    init(manager: CategoriesAPIManager) {
        self.manager = manager
        super.init()
    }
}
