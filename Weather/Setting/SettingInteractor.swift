//
//  SettingInteractor.swift
//  Weather
//
//  Created by Avinash  Tag on 22/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

protocol SettingBusinessLogic
{
}

protocol SettingDataStore
{
  //var name: String { get set }
}

class SettingInteractor: SettingBusinessLogic, SettingDataStore
{
  var presenter: SettingPresentationLogic?
  var worker: SettingWorker?
}
