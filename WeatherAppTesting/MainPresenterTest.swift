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
    var mainView: MainView!
    
//    override func setUp() {
//        super.setUp()
//
//    }
    
    func testData() {
        mainPresenter.recievedCityName("Tambov")
        XCTAssertTrue((mainView as! MainView_Mock).isCityNameCorrect)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mainPresenter = MainPresenter(with: networkMock, locationManager: locationMock)
        mainView = MainView_Mock()
        mainPresenter.mainViewController = mainView
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mainPresenter = nil
        mainView = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
