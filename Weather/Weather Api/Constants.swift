//
//  Constants.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import Foundation


struct Constant {
    
    struct API {
        
    }
    
    struct Error {
        var isNetworkIssue: Bool = false
        var info: String = Localisable.somethingWrong
    }
    static let POST = "POST"
    static let GET = "GET"
    static let CONTENT_TYPE = "Content-Type"
    static let AUTHENTICATION_CONTENT_TYPE = "application/x-www-form-urlencoded"
    static let CONTENT_TYPE_VALUE = "application/json"

}

struct Localisable {
    
    static let Alert = "AppName".localized()
    static let Okay = "Okay".localized()
    static let Yes = "Yes".localized()
    static let No = "No".localized()
    static let somethingWrong = "somethingWrong".localized()

}
