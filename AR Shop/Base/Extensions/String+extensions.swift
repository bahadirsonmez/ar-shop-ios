//
//  String+extensions.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import Foundation

extension String {
    func localized(with comment: String = "") -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
    
    func localized(with comment: String = "", value: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: value, comment: comment)
    }
}
