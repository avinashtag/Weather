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
  
  // MARK: present weather result check sucess and error
  
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
    
}

// Extenstion Utility methods
extension DashboardPresenter{
    
    private func sendError(error:Constant.Error = Constant.Error()){
        DispatchQueue.main.async {
            self.viewController?.display(error: error)
        }
    }
    
    func parse(weather: Weather.Result) -> Weather.View {
        
        let theme = viewController!.currentTheme
        var model = Weather.View()
        
        model.city = theme.city.name
        model.updateTime = weather.updateTime ?? Date().weatherDate()
        if theme.temprature == .celcius{
            //TODO:: Convert into celcius
            model.temprature = "\(weather.main.temp.celcius()) °C"
        }
        else{
            model.temprature = "\(weather.main.temp.fahrenheit()) °F"
        }
        if theme.wind == .kilometerPerHour{
            //TODO:: Convert into kilometerPerHour
            model.wind = String(format: Localisable.wind,"\(weather.wind.speed.kmPerHr()) km/h")
        }
        else{
            model.wind = String(format: Localisable.wind,"\(weather.wind.speed.milesPerHr()) miles/h")
        }

        if let weathershort = weather.weather.first?.main{
            model.weatherConditionShort = weathershort
        }
        if let weatherInfo = weather.weather.first?.weatherDescription{
            model.weatherCondition =  String(format: Localisable.weatherDetail ,weatherInfo)
        }
        if let weatherIcon = weather.weather.first?.icon{
            let endpoint = Calls.weatherIcon(weatherIcon)
            if let imageurl = endpoint.imageUrl{
                model.imageUrl =  imageurl
            }
        }

        model.updateTime =  String(format: Localisable.updatedTime ,weather.updateTime ?? Date().weatherDate())  
        return model
        
    }

}

extension Localisable{
    
    static let city = "City".localized()
    static let updatedTime = "UpdatedTime".localized()
    static let weather = "Weather".localized()
    static let temperature = "Temperature".localized()
    static let wind = "Wind".localized()
    static let weatherDetail = "weatherDetail".localized()
    
    static let sydney = "Sydney".localized()
    static let melbourne = "Melbourne".localized()
    static let wollongong = "Wollongong".localized()
}
