//
//  PostalCodeSearchViewControllerUITests.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/28/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import XCTest

class PostalCodeSearchViewControllerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPostalCodeSearch() {
        let app = XCUIApplication()

        let navigationBar = app.navigationBars["PostalCodeSearchNavigationBar"]
        let cell = app.cells.matching(.cell, identifier: "ReuseIdentifier").element(boundBy: 1)
        let textField = app.textFields["PostalCodeTextField"]
        let searchButton = app.buttons["Search"]
        let searchResult = app.staticTexts["SearchResult"]

        login()

        cell.tap()
        textField.tap()
        textField.typeText("1600022")
        searchButton.tap()

        XCTAssertFalse(navigationBar.exists)
        // 非同期処理を挟むので3秒くらい余裕をとる
        expectation(for: Predicate(format: "label == '東京都新宿区新宿'"), evaluatedWith: searchResult, handler: nil)
        waitForExpectations(withTimeout: 3, handler: nil)
    }

    func testRecordUITest() {
        let app = XCUIApplication()

        XCUIApplication().buttons["LoginButton"].tap()
        app.links["強制的にログイン成功"].tap()

        app.tables["SelectFeatureTableView"].staticTexts["Postal Code Search"].tap()

        let postalcodetextfieldTextField = app.textFields["PostalCodeTextField"]
        postalcodetextfieldTextField.tap()
        postalcodetextfieldTextField.typeText("1600022")
        app.buttons["Search"].tap()
    }

}
