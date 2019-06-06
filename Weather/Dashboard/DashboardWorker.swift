//
//  DashboardWorker.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

class DashboardWorker: Client
{

    func currentWeather(request: Weather.Request,_ completionHandler:  @escaping (APIResult<Weather.Result?, APIError>) -> Void) {
        
        var endpoint = Calls.weather
        endpoint.queryParams = request.queryParameter()
        var urlRequest = endpoint.urlRequest
        urlRequest.httpMethod = Constant.GET
        urlRequest.setValue(Constant.CONTENT_TYPE_VALUE, forHTTPHeaderField:Constant.CONTENT_TYPE)
        
        fetch(with: urlRequest, decode: { json -> Weather.Result? in
            guard let result = json as? Weather.Result else { return  nil }
            return result
        }, completion: completionHandler)
    }

}
