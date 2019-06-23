//
//  DashboardRouter.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

@objc protocol DashboardRoutingLogic
{
    func routeToSetting(segue: UIStoryboardSegue?)
}

protocol DashboardDataPassing
{
    var dataStore: DashboardDataStore? { get }
    func refreshWeather()
}

class DashboardRouter: NSObject, DashboardRoutingLogic, DashboardDataPassing
{
  weak var viewController: DashboardViewController?
  var dataStore: DashboardDataStore?
  
    func refreshWeather() {
        viewController?.refreshWeather()
    }
    
    func routeToSetting(segue: UIStoryboardSegue?)
    {
        if let setting = segue?.destination as? SettingViewController {
            
            setting.dashboard = self
        }
    }

}
