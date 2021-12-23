//
//  MainPresenterTest.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 06.12.2021.
//

import XCTest
@testable import WeatherApp

class MainPresenterTest: XCTestCase {

    var networkMock = NetworkController_Mock()
    var locationMock = LocationController_Mock()
    var mainView = MainView_Mock()
    var router = MainRouterImpl(with: UINavigationController())
    var mainPresenter: MainPresenter!
    
    func testMainPresenterForCorrectData() {
        let name = "Тамбов"
        let location = LocationData(longitude: 41.4517589,
                                    lattitude: 52.7211462)
        let jsonData = Model_MockData.jsonData
        let items = jsonData.convertToItems()
        
        locationMock.mockResult = .success(location)
        networkMock.mockResult = .success(jsonData)
        
        mainPresenter.recieveWeatherForCityName(name)
        
        XCTAssertTrue(locationMock.isCalled)
        XCTAssertEqual(locationMock.mockName, name)
        
        XCTAssertTrue(networkMock.isCalled)
        XCTAssertEqual(networkMock.mockLocation, location)
        
        XCTAssertTrue(mainView.isCalledProvideForcastData)
        XCTAssertTrue(mainView.isCalledStartLoadingWeather)
        XCTAssertEqual(mainView.nameRecivied, name)
        XCTAssertEqual(mainView.dataReceived, items)
    }
    
    func testMainPresenterForIncorrectName() {
        let name = "blabla"
        let errorMessage = "No Location"
        let locationError = WeatherError.missingLocation(errorMessage)
        
        locationMock.mockName = name
        locationMock.mockResult = .failure(locationError)
        
        mainPresenter.recieveWeatherForCityName(name)
        
        XCTAssertTrue(locationMock.isCalled)
        XCTAssertEqual(locationMock.mockName, name)
        
        XCTAssertFalse(networkMock.isCalled)
        XCTAssertTrue(mainView.isCalledStartLoadingWeather)
        XCTAssertFalse(mainView.isCalledProvideForcastData)
    }
    
    func testMainPresenterForIncorrectData() {
        let name = "Tambov"
        let location = LocationData(longitude: 41.4517589,
                                    lattitude: 52.7211462)
        let errorMessage = "No Data"
        let serverError = WeatherError.serverError(errorMessage)
        
        locationMock.mockName = name
        locationMock.mockResult = .success(location)
        
        networkMock.mockResult = .failure(serverError)
        
        mainPresenter.recieveWeatherForCityName(name)
        
        XCTAssertTrue(locationMock.isCalled)
        XCTAssertEqual(locationMock.mockName, name)
        
        XCTAssertTrue(networkMock.isCalled)
        XCTAssertEqual(networkMock.mockLocation, location)
        
        XCTAssertFalse(mainView.isCalledProvideForcastData)
        XCTAssertTrue(mainView.isCalledStartLoadingWeather)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mainPresenter = MainPresenterImpl(with: networkMock, locationManager: locationMock, router: router)
        mainView = MainView_Mock()
        mainPresenter.view = mainView
    }

    override func tearDownWithError() throws {
        
    }
}
