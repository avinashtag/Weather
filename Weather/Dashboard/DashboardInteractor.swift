//
//  DashboardInteractor.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

protocol DashboardBusinessLogic
{
    func currentWeather(request: Weather.Request)
}

protocol DashboardDataStore
{
  //var name: String { get set }
}

class DashboardInteractor: DashboardBusinessLogic, DashboardDataStore
{
  var presenter: DashboardPresentationLogic?
  var worker: DashboardWorker?
  //var name: String = ""
  
  // MARK: Fetch Current Weather
  
  func currentWeather(request: Weather.Request)
  {
    worker = DashboardWorker()
    worker?.currentWeather(request: request, { (result) in
        self.presenter?.presentWeather(result: result)
    })
  }
}
