//
//  SettingViewController.swift
//  Weather
//
//  Created by Avinash  Tag on 22/06/2019.
//  Copyright (c) 2019 Avinash  Tag. All rights reserved.
//

import UIKit

protocol SettingDisplayLogic: class
{
}

class SettingViewController: UITableViewController, SettingDisplayLogic
{
    
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var windSegment: UISegmentedControl!
    @IBOutlet weak var tempratureSegment: UISegmentedControl!
    
    private var cityDaSource: Setting.Selection! = Setting.Selection()
    private var citySelectionController: SelectionViewController!
    
    var interactor: SettingBusinessLogic?
    var router: (NSObjectProtocol & SettingRoutingLogic & SettingDataPassing)?
    var dashboard: DashboardDataPassing?
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
        let interactor = SettingInteractor()
        let presenter = SettingPresenter()
        let router = SettingRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
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
        
        self.tableView.accessibilityIdentifier = "settingsTable"
        self.windSegment.accessibilityIdentifier = "windSegment"
        self.tempratureSegment.accessibilityIdentifier = "tempratureSegment"
        let currentTheme = self.theme

        cityName.text = currentTheme.city.name
        citySelectionController = self.storyboard?.instantiateViewController(withIdentifier: "SelectionViewControllerID") as? SelectionViewController
        citySelectionController.presentationLogic = self
        citySelectionController.accessibilityLabel = "citySelectionPopover"
        cityName.rightView = rightView
        cityName.rightViewMode = .always
        
        self.windSegment.selectedSegmentIndex = currentTheme.wind!.rawValue
        self.tempratureSegment.selectedSegmentIndex = currentTheme.temprature!.rawValue

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        let backgroundImage = UIImageView(image: UIImage(named: "background.png"))
        self.tableView.backgroundView = backgroundImage
    }
    
    
    @IBAction func tempratureChange(_ sender: UISegmentedControl) {
        
        var currentTheme = self.theme
        currentTheme.temprature = Setting.TempratureUnit(rawValue: sender.selectedSegmentIndex)
        UserDefaults.standard.saveTheme(currentTheme)
    }
    
    @IBAction func windChange(_ sender: UISegmentedControl) {
        var currentTheme = self.theme
        currentTheme.wind = Setting.WindUnit(rawValue: sender.selectedSegmentIndex)
        UserDefaults.standard.saveTheme(currentTheme)
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.dashboard?.refreshWeather()
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: Textfield Delegate

extension SettingViewController: UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        showCitySelection()
        return false
    }
    
    func showCitySelection(){
        
        var anchor = cityName.bounds
        anchor.origin.x = anchor.width/2
        guard let popover = citySelectionController else { return }
        popover.tableView.reloadData()
        
        let maxContentSize = CGSize(width: self.view.bounds.width * 0.8, height: (self.view.bounds.height - anchor.origin.y) * 0.8)
        
        popover.preferredContentSize = popover.prefferedSize(maxSize: maxContentSize)
        popover.modalPresentationStyle = UIModalPresentationStyle.popover
        popover.popoverPresentationController?.delegate =  self
        popover.popoverPresentationController?.sourceView = cityName
        popover.popoverPresentationController?.sourceRect = anchor
        popover.popoverPresentationController?.permittedArrowDirections = .up
        popover.popoverPresentationController?.backgroundColor = #colorLiteral(red: 0.1261125803, green: 0.2115471959, blue: 0.3016554117, alpha: 1)
        self.present(popover, animated: true) {
            
        }
        
    }
}

// MARK: SelectionPresentationLogic

extension SettingViewController: SelectionPresentationLogic{
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return cityDaSource.cities.count
    }
    
    func titleForRowAt( indexPath: IndexPath) -> (String, UITableViewCell.AccessoryType){
        var accessory = UITableViewCell.AccessoryType.none
        if cityDaSource.cities[indexPath.row] == self.theme.city{
            accessory = UITableViewCell.AccessoryType.checkmark
        }
        return (cityDaSource.cities[indexPath.row].name, accessory)
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        citySelectionController.dismiss(animated: true) {
            self.cityDaSource.selected = self.cityDaSource.cities[indexPath.row]
            self.cityName.text = self.cityDaSource.selected.name
            var currentTheme = self.theme
            currentTheme.city = self.cityDaSource.selected
            UserDefaults.standard.saveTheme(currentTheme)
        }
    }
    
    
}

// MARK: UIPopoverPresentationControllerDelegate

extension SettingViewController: UIPopoverPresentationControllerDelegate{
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
