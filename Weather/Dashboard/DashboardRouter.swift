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
}

protocol DashboardDataPassing
{
  var dataStore: DashboardDataStore? { get }
}

class DashboardRouter: NSObject, DashboardRoutingLogic, DashboardDataPassing
{
  weak var viewController: DashboardViewController?
  var dataStore: DashboardDataStore?
  
}
