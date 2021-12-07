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
        let name = "Tambov"
        let location = LocationData(longitude: 41.4517589,
                                    lattitude: 52.7211462)
        let jsonData = JSONWeatherData(list: [], city: City(name: name,
                                                            coord: Coordinates(lat: Float(location.lattitude),
                                                                               lon: Float(location.longitude))))
        
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
        XCTAssertEqual(mainView.dataReceived, jsonData)
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
