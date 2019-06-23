//
//  DashboardViewController.swift
//  Weather
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

protocol DashboardDisplayLogic: class
{
    func display(error: Constant.Error)
    func display(weather: Weather.View)
    var currentTheme: Setting.Theme { get}
    func refreshWeather()
}

class DashboardViewController: UIViewController
{

    @IBOutlet weak var weatherDetailList: UITableView!
    @IBOutlet weak var weatherDetailListHeader: UIView!

    private var weather: Weather.View!

    var interactor: DashboardBusinessLogic?
    var router: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter()
        let router = DashboardRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        weather = Weather.View()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        weatherDetailList.accessibilityIdentifier = "weatherDetailList"
        weatherDetailList.addRefreshControl(title: Localisable.refreshMessage) {
            self.interactor?.currentWeather(request: Weather.Request(cityName: self.theme.city.name, country: self.theme.city.country, appid: Constant.apiKey))
        }
        self.interactor?.currentWeather(request: Weather.Request(cityName: self.theme.city.name, country: self.theme.city.country, appid: Constant.apiKey))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func reloadView()  {
        self.weatherDetailList.reloadData()
    }
    
}


// MARK: Tableview Delegate

extension DashboardViewController: UITableViewDelegate{
    
}

// MARK: Tableview Datasource

extension DashboardViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherCell else { return UITableViewCell() }
        
        cell.city.text = weather.city
        cell.wind.text = weather.wind
        cell.temprature.text = weather.temprature
        cell.updateDate.text = weather.updateTime
        cell.condition.text = weather.weatherCondition
        cell.shortDescription.text = weather.weatherConditionShort
        if let imageUrl = weather.imageUrl{
            cell.conditionImage.image(url: imageUrl) { (data) in
                
            }
        }
        return cell
    }
    
}

// MARK: DashboardDisplayLogic

extension DashboardViewController: DashboardDisplayLogic{
  
    var currentTheme: Setting.Theme {
        return self.theme
    }
    
    func display(error: Constant.Error) {

        weatherDetailList.refreshControl?.endRefreshing()
        weather = Weather.View()
        self.reloadView()
        self.present(error: error) {
            
        }
    }
    
    func display(weather: Weather.View) {
        weatherDetailList.refreshControl?.endRefreshing()
        self.weather = weather
        self.reloadView()
    }
    
    func refreshWeather(){
        self.interactor?.currentWeather(request: Weather.Request(cityName: self.theme.city.name, country: self.theme.city.country, appid: Constant.apiKey))
    }
}

extension Localisable{
    static let refreshMessage = "RefreshMessage".localized()
}
