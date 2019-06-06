//
//  DashboardPresenter.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

protocol DashboardPresentationLogic
{
    func presentWeather(result: APIResult<Weather.Result?, APIError>)
}

class DashboardPresenter: DashboardPresentationLogic
{
  weak var viewController: DashboardDisplayLogic?
  
  // MARK: Do something
  
    func presentWeather(result: APIResult<Weather.Result?, APIError>)
    {
        switch result {
        case .success(let response):
            guard response != nil else{
                let error = Constant.Error(isNetworkIssue: false, info: Localisable.responseNull)
                self.sendError(error: error)
                return
            }
            DispatchQueue.main.async {
                self.viewController?.display( weather: self.parse(weather: response!))
            }
            break
            
        case .failure(let error):
            guard error.localizedDescription != "" else{
                self.sendError()
                return
            }
            sendError(error: Constant.Error(isNetworkIssue: error.localizedDescription == APIError.noNetwork.localizedDescription, info: error.localizedDescription))
        }
        
    }
    
    private func sendError(error:Constant.Error = Constant.Error()){
        self.viewController?.display(error: error)
    }

    private func parse(weather: Weather.Result) -> [Weather.Data] {
        
        var dataSource = Weather.Datasource()
        if let weatherInfo = weather.weather.first?.weatherDescription{
            dataSource.weatherInfo.info = weatherInfo
        }
        dataSource.temperature.info = "\(weather.main.temp) F"
        dataSource.wind.info = "\(weather.wind.speed) miles/h"
        dataSource.updatedTime.info = weather.updateTime ?? Date().weatherDate()


        return [dataSource.city, dataSource.updatedTime, dataSource.weatherInfo, dataSource.temperature, dataSource.wind]
        
    }
}


extension Localisable{
    
    static let city = "City".localized()
    static let updatedTime = "UpdatedTime".localized()
    static let weather = "Weather".localized()
    static let temperature = "Temperature".localized()
    static let wind = "Wind".localized()
    
    static let sydney = "Sydney".localized()
    static let melbourne = "Melbourne".localized()
    static let wollongong = "Wollongong".localized()
}
