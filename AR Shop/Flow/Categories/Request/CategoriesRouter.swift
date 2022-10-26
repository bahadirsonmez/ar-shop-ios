//
//  CategoriesRouter.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 13.01.2022.
//

import Alamofire
import Foundation

enum CategoriesRouter: URLRequestConvertible {
    case getCategories
    case getSubCategories(id: Int)
    
    static let apiURLString = "Constants.baseURL"

    public var path: String {
        switch self {
        case .getCategories:
            return "/api/categories/get"
        case .getSubCategories(let id):
            return "/api/categories/get/\(id)"
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .getCategories, .getSubCategories:
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try CategoriesRouter.apiURLString.asURL()
        var urlRequest = URLRequest(url: (url.appendingPathComponent(path)))
        //let newURLRequest = urlRequest.description.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let newURLRequest = urlRequest.description.removingPercentEncoding
        let convertedURL = URL(string: newURLRequest!)
        urlRequest = URLRequest(url: convertedURL!)
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .getCategories, .getSubCategories:
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let accessToken = KeychainAccount.sharedAccount.accessToken
            urlRequest.addValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")
        }

        return urlRequest
    }
}
