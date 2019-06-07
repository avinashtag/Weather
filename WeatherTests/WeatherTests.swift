//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Avinash  Tag on 05/06/2019.
//  Copyright © 2019 Avinash  Tag. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {

    var dashboardWorker : DashboardWorker?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testPerformanceWeatherApi() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            dashboardWorker = DashboardWorker()
            let cityDaSource = Weather.Selection()
            let request = Weather.Request(cityName: cityDaSource.selected.name, country: cityDaSource.selected.country, appid: Constant.apiKey)
            dashboardWorker?.currentWeather(request: request, { (result) in

            })
        }
    }

    func testCurrentWeatherApi() {
        
        let promise = expectation(description: "Weather Api Success")

        dashboardWorker = DashboardWorker()
        let cityDaSource = Weather.Selection()
        let request = Weather.Request(cityName: cityDaSource.selected.name, country: cityDaSource.selected.country, appid: Constant.apiKey)
        dashboardWorker?.currentWeather(request: request, { (result) in
            switch result {
            case .success(let response):
                guard response != nil else{
                    XCTFail("Api Fail: \(Localisable.responseNull)")
                    return
                }
                promise.fulfill()
                break
                
            case .failure(let error):
                guard error.localizedDescription != "" else{
                    XCTFail("Api Fail: \(Localisable.somethingWrong)")
                    return
                }
                XCTFail("Api Fail: \(error.localizedDescription)")
            }
        })
        wait(for: [promise], timeout: 5)
    }
}
