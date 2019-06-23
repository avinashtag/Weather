//
//  SettingModels.swift
//  Weather
//
//  Created by Avinash  Tag on 22/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

enum Setting
{
  // MARK: Use cases
    struct Selection {
        let cities : [City] = [City(name: Localisable.sydney, country: "au"), City(name: Localisable.melbourne, country: "au"), City(name: Localisable.wollongong, country: "au")]
        var selected: City = City(name: Localisable.sydney, country: "au")
    }
    
    struct  City : Codable{
        let name: String
        let country: String
        
        static func == (lhs:City, rhs: City) -> Bool {
            return ((lhs.name == rhs.name) && lhs.country == rhs.country)
        }
    }
    

    struct Theme: Codable {
        
        var type: ThemeType! = .dark
        var city: City! = City(name: Localisable.sydney, country: "au")
        var temprature: TempratureUnit! = .celcius
        var wind: WindUnit! = .kilometerPerHour
    }
    
    enum WindUnit: Int, Codable {
        case kilometerPerHour = 1
        case milesPerHour = 0
    }
    enum TempratureUnit: Int, Codable {
        case celcius = 0
        case fahrenheit = 1
    }
    enum ThemeType: Int, Codable {
        case dark = 1
        case light = 2
    }
}
