//
//  Client.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import Foundation

class Client: APIClient {
    
    // MARK: - Singleton Pattern
    static let sharedInstance = Client(configuration: .default)
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
        self.session.configuration.requestCachePolicy = .returnCacheDataElseLoad
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    
}
