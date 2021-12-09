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
    var mainPresenter: MainPresenter!
    
    func testMainPresenterForCorrectData() {
        let name = "Тамбов"
        let location = LocationData(longitude: 41.4517589,
                                    lattitude: 52.7211462)
        let jsonData = Model_MockData.jsonData
        let items = jsonData.convertToItems()
        
        
        locationMock.mockResult = .success(location)
        networkMock.mockResult = .success(jsonData)
        
        mainPresenter.recievedCityName(name)
        
        XCTAssertTrue(locationMock.isCalled)
        XCTAssertEqual(locationMock.mockName, name)
        
        XCTAssertTrue(networkMock.isCalled)
        XCTAssertEqual(networkMock.mockLocation, location)
        
        XCTAssertTrue(mainView.isCalledReciviedForCity)
        XCTAssertTrue(mainView.isCalledProvideForcastData)
        XCTAssertEqual(mainView.nameRecivied, name)
        XCTAssertEqual(mainView.dataReceived, items)
    }
    
    func testMainPresenterForIncorrectName() {
        let name = "blabla"
        let errorMessage = "No Location"
        let locationError = WeatherError.missingLocation(errorMessage)
        
        locationMock.mockName = name
        locationMock.mockResult = .failure(locationError)
        
        mainPresenter.recievedCityName(name)
        
        XCTAssertTrue(locationMock.isCalled)
        XCTAssertEqual(locationMock.mockName, name)
        
        XCTAssertFalse(networkMock.isCalled)
        XCTAssertFalse(mainView.isCalledProvideForcastData)
        XCTAssertFalse(mainView.isCalledReciviedForCity)
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
        
        mainPresenter.recievedCityName(name)
        
        XCTAssertTrue(locationMock.isCalled)
        XCTAssertEqual(locationMock.mockName, name)
        
        XCTAssertTrue(networkMock.isCalled)
        XCTAssertEqual(networkMock.mockLocation, location)
        
        XCTAssertFalse(mainView.isCalledReciviedForCity)
        XCTAssertFalse(mainView.isCalledProvideForcastData)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mainPresenter = MainPresenter(with: networkMock, locationManager: locationMock)
        mainView = MainView_Mock()
        mainPresenter.mainViewController = mainView
    }

    override func tearDownWithError() throws {
        
    }
}
