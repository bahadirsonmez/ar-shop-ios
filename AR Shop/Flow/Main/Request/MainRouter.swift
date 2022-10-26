//
//  MainRouter.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import Alamofire
import Foundation

enum MainRouter: URLRequestConvertible {
    case getHomeData
    
    static let apiURLString = "Constants.baseURL"

    public var path: String {
        switch self {
        case .getHomeData:
            return "/api/main/get"
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .getHomeData:
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try MainRouter.apiURLString.asURL()
        var urlRequest = URLRequest(url: (url.appendingPathComponent(path)))
        //let newURLRequest = urlRequest.description.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let newURLRequest = urlRequest.description.removingPercentEncoding
        let convertedURL = URL(string: newURLRequest!)
        urlRequest = URLRequest(url: convertedURL!)
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .getHomeData:
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let accessToken = KeychainAccount.sharedAccount.accessToken
            urlRequest.addValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")
        }

        return urlRequest
    }
}
