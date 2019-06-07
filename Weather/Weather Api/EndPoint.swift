//
//  EndPoint.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryParams: [URLQueryItem] { get set }
}


extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        if !queryParams.isEmpty {
            components.queryItems = queryParams
        }
        return components
    }
    
    var urlRequest: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        let headers = request.allHTTPHeaderFields ?? [:]
        request.allHTTPHeaderFields = headers
        return request
    }
    
    var hosname: String {
        return base
    }
}

enum Calls {
    case weather
}

extension Calls: Endpoint {
    
    struct Keeper {
        static var _queryParams:[URLQueryItem] = [URLQueryItem]()
    }
    
    var queryParams: [URLQueryItem] {
        get {
            return Keeper._queryParams
        }
        set (newValue) {
            Keeper._queryParams = newValue
        }
    }
    
    var base: String {
        let env = "http://\(Bundle.main.infoDictionary!["API_ENDPOINT"] as! String)"
        return env
    }
    
    var path: String {
        switch self {
            
        case .weather : return Constant.API.weatherEndPoint
        }
    }
}
