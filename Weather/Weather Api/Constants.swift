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
        static let weatherEndPoint = "/data/2.5/weather"
        static let imageEndPoint = "/img/w/%@"
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
    static let apiKey = "ba95e21bb1d15138195f08524427ee63"

}

struct Localisable {
    
    static let Alert = "AppName".localized()
    static let Okay = "Okay".localized()
    static let Yes = "Yes".localized()
    static let No = "No".localized()
    static let somethingWrong = "somethingWrong".localized()
    static let jsonFailure = "jsonFailure".localized()
    static let jsonParsing = "jsonParsing".localized()
    static let responseNull = "responseNull".localized()

}
