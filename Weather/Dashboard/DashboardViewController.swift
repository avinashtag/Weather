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
    func display(weather: [Weather.Data])
}

class DashboardViewController: UIViewController
{

    @IBOutlet weak var weatherDetailList: UITableView!
    @IBOutlet weak var weatherDetailListHeader: UIView!
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var rightView: UIView!

    private var weather: [Weather.Data]!
    private var cityDaSource: Weather.Selection!
    private var citySelectionController: SelectionViewController!

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
        let dataSource = Weather.Datasource()
        weather = [dataSource.city, dataSource.updatedTime, dataSource.weatherInfo, dataSource.temperature, dataSource.wind]
        cityDaSource = Weather.Selection()
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
        
        cityName.text = cityDaSource.selected.name
        citySelectionController = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewControllerID") as? SelectionViewController
        citySelectionController.presentationLogic = self
        cityName.rightView = rightView
        cityName.rightViewMode = .always
        interactor?.currentWeather(request: Weather.Request(cityName: self.cityDaSource.selected.name, country: self.cityDaSource.selected.country, appid: Constant.apiKey))
    }
    
    func reloadView()  {
        self.weather[0].info = cityDaSource.selected.name
        self.weatherDetailList.reloadData()
    }
    
}

extension DashboardViewController: UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        showCitySelection()
        return false
    }
    
    func showCitySelection(){
      
        let anchor = cityName.bounds
        guard let popover = citySelectionController else { return }
        popover.tableView.reloadData()
        
        let maxContentSize = CGSize(width: self.view.bounds.width * 0.8, height: (self.view.bounds.height - anchor.origin.y) * 0.8)
        
        popover.preferredContentSize = popover.prefferedSize(maxSize: maxContentSize)
        popover.modalPresentationStyle = UIModalPresentationStyle.popover
        popover.popoverPresentationController?.delegate =  self
        popover.popoverPresentationController?.sourceView = cityName
        popover.popoverPresentationController?.sourceRect = anchor
        popover.popoverPresentationController?.permittedArrowDirections = .up
        
        self.present(popover, animated: true) {
            
        }

    }
}


extension DashboardViewController: UITableViewDelegate{
    
}

extension DashboardViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherCell else { return UITableViewCell() }
        
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.black.cgColor

        let data = weather[indexPath.row]
        cell.name.text = data.name
        cell.value.text = data.info
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return self.weatherDetailListHeader
//    }
}

extension DashboardViewController: DashboardDisplayLogic{
    
    func display(error: Constant.Error) {
        
    }
    
    func display(weather: [Weather.Data]) {
        
        self.weather = weather
        self.reloadView()
    }
}


extension DashboardViewController: SelectionPresentationLogic{
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return cityDaSource.cities.count
    }
    
    func titleForRowAt( indexPath: IndexPath) -> String{
        return cityDaSource.cities[indexPath.row].name
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        citySelectionController.dismiss(animated: true) {
            self.cityDaSource.selected = self.cityDaSource.cities[indexPath.row]
            self.cityName.text = self.cityDaSource.selected.name
            self.interactor?.currentWeather(request: Weather.Request(cityName: self.cityDaSource.selected.name, country: self.cityDaSource.selected.country, appid: Constant.apiKey))
        }
    }
    
    
}

extension DashboardViewController: UIPopoverPresentationControllerDelegate{
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
