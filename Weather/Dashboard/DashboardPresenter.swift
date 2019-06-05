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
  func presentSomething(response: Dashboard.Something.Response)
}

class DashboardPresenter: DashboardPresentationLogic
{
  weak var viewController: DashboardDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Dashboard.Something.Response)
  {
    let viewModel = Dashboard.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
