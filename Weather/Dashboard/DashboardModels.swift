//
//  DashboardModels.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

enum Weather
{
    
    struct View: Codable {
        
        var city: String = "--"
        var temprature: String = "--"
        var wind: String = "--"
        var weatherConditionShort: String = "--"
        var weatherCondition: String = "--"
        var updateTime: String = "--"
        var imageUrl: URL?
    }

    // MARK: - Request
    struct Request: Codable {
        let cityName: String
        let country: String
        let appid : String
        
        func queryParameter() -> [URLQueryItem] {
            return [URLQueryItem(name: "q", value: "\(cityName),\(country)"),
            URLQueryItem(name: "appid", value: "\(appid)")]
        }
    }
    
    // MARK: - Result
    struct Result: Codable {
        let coord: Coord
        let weather: [Climate]
        let base: String
        let main: Main
        let visibility: Int
        let wind: Wind
        let clouds: Clouds
        let dt: Int
        let sys: Sys
        let id: Int
        let name: String
        let cod: Int
        var updateTime: String? {
            get{
                return Date(timeIntervalSince1970: TimeInterval(integerLiteral: Int64(dt))).weatherDate()
            }
        }
        
        
    }
    
    // MARK: - Clouds
    struct Clouds: Codable {
        let all: Int
    }
    
    // MARK: - Coord
    struct Coord: Codable {
        let lon, lat: Double
    }
    
    // MARK: - Main
    struct Main: Codable {
        let temp: Double
        let pressure, humidity: Int
        let tempMin, tempMax: Double
        
        enum CodingKeys: String, CodingKey {
            case temp, pressure, humidity
            case tempMin = "temp_min"
            case tempMax = "temp_max"
        }
    }
    
    // MARK: - Sys
    struct Sys: Codable {
        let type, id: Int
        let message: Double
        let country: String
        let sunrise, sunset: Int
    }
    
    // MARK: - Weather
    struct Climate: Codable {
        let id: Int
        let main, weatherDescription, icon: String
        
        enum CodingKeys: String, CodingKey {
            case id, main
            case weatherDescription = "description"
            case icon
        }
    }
    
    // MARK: - Wind
    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
    
    struct Data: Codable {
        
        var name: String
        var info: String
    }

}
