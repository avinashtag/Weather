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
            let city = self.theme.city!
            let request = Weather.Request(cityName: city.name, country: city.country, appid: Constant.apiKey)
            dashboardWorker?.currentWeather(request: request, { (result) in

            })
        }
    }

    func testCalculationFahrenheit() {
        
        let promise = expectation(description: "Fahrenheit Conversion Success")

        let kelvinTemprature: Double = 283.15
        
        let fahrenheit = kelvinTemprature.fahrenheit()
        guard fahrenheit == "50" else {
            XCTFail("Fahrenheit Conversion Failure")
            return
        }
        promise.fulfill()
        wait(for: [promise], timeout: 5)
    }
    
    func testCalculationCelcius() {
        
        let promise = expectation(description: "Celcius Conversion Success")
        
        let kelvinTemprature: Double = 283.15
        
        let celcius = kelvinTemprature.celcius()
        guard celcius == "10" else {
            XCTFail("Celcius Conversion Failure")
            return
        }
        promise.fulfill()
        wait(for: [promise], timeout: 5)
    }
    
    func testCalculationkmph() {
        
        let promise = expectation(description: "kmph Conversion Success")
        
        let wind: Double = 0.55
        
        let kmph = wind.kmPerHr()
        guard kmph == "2" else {
            XCTFail("kmph Conversion Failure")
            return
        }
        promise.fulfill()
        wait(for: [promise], timeout: 5)
    }

    func testCalculationmph() {
        
        let promise = expectation(description: "miles per hr Conversion Success")
        
        let wind: Double = 0.89
        
        let mph = wind.milesPerHr()
        guard mph == "2" else {
            XCTFail("miles per hr Conversion Failure")
            return
        }
        promise.fulfill()
        wait(for: [promise], timeout: 5)
    }

    func testdownloadImage() {
        
        let promise = expectation(description: "Image Download Success")
        guard let url = URL(string: "http://openweathermap.org/img/w/10d.png") else{
            
            XCTFail("Image Download Failure (wrong url)")
            return
        }
        
        _ = UIImageView().image(url:url ) { (data) in
            
            guard data != nil else{
                XCTFail("Image Download Failure")
                return
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 5)
    }

    
    func testCurrentWeatherApi() {
        
        let promise = expectation(description: "Weather Api Success")
        
        dashboardWorker = DashboardWorker()
        let city = self.theme.city!
        let request = Weather.Request(cityName: city.name, country: city.country, appid: Constant.apiKey)
        dashboardWorker?.currentWeather(request: request, { (result) in
            switch result {
            case .success(let response):
                guard response != nil else{
                    XCTFail("Api Fail: \(Localisable.responseNull)")
                    return
                }
                
                let presenter = DashboardPresenter()
                presenter.viewController = self
                let weather = presenter.parse(weather: response!)
                
                guard let url = weather.imageUrl else{
                    
                    XCTFail("Weather Api Image Download Failure (wrong url)")
                    return
                }
                
                DispatchQueue.main.async {
                    _ = UIImageView().image(url:url ) { (data) in
                        
                        guard data != nil else{
                            XCTFail("Weather Api Image Download Failure")
                            return
                        }
                        promise.fulfill()
                    }
                }

                break
                
            case .failure(let error):
                guard error.localizedDescription != "" else{
                    XCTFail("Api Fail: \(Localisable.somethingWrong)")
                    return
                }
                XCTFail("Api Fail: \(error.localizedDescription)")
            }
        })
        wait(for: [promise], timeout: 10)
    }

}

extension WeatherTests: DashboardDisplayLogic{
    func display(error: Constant.Error){
        
    }
    func display(weather: Weather.View){
        
    }
    var currentTheme: Setting.Theme {
        return self.theme
    }
    func refreshWeather(){
        
    }

}
