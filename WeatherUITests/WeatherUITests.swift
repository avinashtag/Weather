//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by Avinash  Tag on 25/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import XCTest

class WeatherUITests: XCTestCase {

    var application: XCUIApplication!
    var weatherList: XCUIElement!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        application = XCUIApplication()
        application.launch()
        weatherList = application.tables["weatherDetailList"]

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWeatherList() {
        // Test Table view exist or no.
        XCTAssert(weatherList.exists, "WeatherList Doesn't Exist")
    }
    
    func testWeatherListCount() {
        // Tableview count always eaqual to 1
        XCTAssert(weatherList.cells.count == 1, "WeatherList Count must be 1")
    }
    
    func testWeatherListCell() {
        // Tableview cell outlet test
        let city = weatherList.cells.staticTexts["Cellcity"]
        let wind = weatherList.cells.staticTexts["Cellwind"]
        let temprature = weatherList.cells.staticTexts["Celltemprature"]
        let updateDate = weatherList.cells.staticTexts["CellupdateDate"]
        let shortDescription = weatherList.cells.staticTexts["CellshortDescription"]
        let condition = weatherList.cells.staticTexts["Cellcondition"]

        XCTAssert(city.exists)
        XCTAssert(wind.exists)
        XCTAssert(temprature.exists)
        XCTAssert(updateDate.exists)
        XCTAssert(shortDescription.exists)
        XCTAssert(condition.exists)
    }
    
    func testSettingNavigate() {
        // Navigation to setting screen test
        application.buttons["settings"].tap()
        let setting = application.tables["settingsTable"]
        XCTAssert(setting.exists, "Navigation Failed")
    }

    func testSettingScreenOutlets() {
        // setting screen outlet test
        application.buttons["settings"].tap()
        let setting = application.tables["settingsTable"]
        XCTAssert(setting.cells.textFields["citySelection"].exists, "citySelection Failed")
        XCTAssert(setting.cells.segmentedControls["windSegment"].exists, "windSegment Failed")
        XCTAssert(setting.cells.segmentedControls["tempratureSegment"].exists, "tempratureSegment Failed")
    }
   
    func testSettingCitySelection() {
        // City selection test
        application.buttons["settings"].tap()
        let setting = application.tables["settingsTable"]
        let citySelection = setting.cells.textFields["citySelection"]
        citySelection.tap()
        
        let popover = application.tables.cells.staticTexts["cityName"]
        XCTAssert(popover.exists, "Navigation Failed")

    }
    
    

}
