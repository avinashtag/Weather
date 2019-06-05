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
  func doSomething(request: Dashboard.Something.Request)
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
  
  // MARK: Do something
  
  func doSomething(request: Dashboard.Something.Request)
  {
    worker = DashboardWorker()
    worker?.doSomeWork()
    
    let response = Dashboard.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
