//
//  SettingRouter.swift
//  Weather
//
//  Created by Avinash  Tag on 22/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

@objc protocol SettingRoutingLogic
{
}

protocol SettingDataPassing
{
  var dataStore: SettingDataStore? { get }
}

class SettingRouter: NSObject, SettingRoutingLogic, SettingDataPassing
{
  weak var viewController: SettingViewController?
  var dataStore: SettingDataStore?
  
}
