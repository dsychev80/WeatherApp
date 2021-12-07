//
//  MainPresenterTest.swift
//  WeatherAppTesting
//
//  Created by Denis Sychev on 06.12.2021.
//

import XCTest
@testable import WeatherApp

class MainPresenterTest: XCTestCase {

    var networkMock: NetworkManager = NetworkController_Mock()
    var locationMock: LocationManager = LocationController_Mock()
    var mainPresenter: MainPresenter!
    
//    override func setUp() {
//        super.setUp()
//
//    }
    
    func testData() {
        mainPresenter.recievedCityName("Tambov")
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mainPresenter = MainPresenter(with: networkMock, locationManager: locationMock)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mainPresenter = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
