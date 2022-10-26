//
//  UserDefaultsHelper.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import UIKit

private enum Defaults: String {
    case eventLink = "eventLink"
}

final class UserDefaultHelper {
    static var eventLink: String? {
        set{
            _set(value: newValue, key: .eventLink)
        } get {
            return _get(valueForKay: .eventLink) as? String ?? ""
        }
    }

    static func deleteEventLink() {
         UserDefaults.standard.removeObject(forKey: Defaults.eventLink.rawValue)
    }

    static func deletaAll() {
        deleteEventLink()
    }
}

extension UserDefaultHelper {
    private static func _set(value: Any?, key: Defaults) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }

    private static func _get(valueForKay key: Defaults)-> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
}
