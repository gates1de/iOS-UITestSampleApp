//
//  LoginViewControllerUITests.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/27/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import XCTest

class LoginViewControllerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoginSuccess() {
        let app = XCUIApplication()

        let selectFeatureTableView = app.tables["SelectFeatureTableView"]

        login()

        // 画面遷移時間考慮
        // 機能選択画面への遷移をログイン成功とみなす
        expectation(for: Predicate(format: "exists == true"), evaluatedWith: selectFeatureTableView, handler: nil)
        waitForExpectations(withTimeout: 1, handler: nil)
    }

    func testSelectedCalculator() {
        let app = XCUIApplication()

        let cell = app.cells.matching(.cell, identifier: "ReuseIdentifier").element(boundBy: 0)
        let calculatorTitle = app.staticTexts["CalculatorTitle"]

        login()

        cell.tap()

        expectation(for: Predicate(format: "exists == true"), evaluatedWith: calculatorTitle, handler: nil)
        waitForExpectations(withTimeout: 1, handler: nil)
    }

    func testSelectedPostalCodeSearch() {
        let app = XCUIApplication()

        let cell = app.cells.matching(.cell, identifier: "ReuseIdentifier").element(boundBy: 1)
        let postalCodeSearchTitle = app.staticTexts["PostalCodeSearchTitle"]

        login()

        cell.tap()

        expectation(for: Predicate(format: "exists == true"), evaluatedWith: postalCodeSearchTitle, handler: nil)
        waitForExpectations(withTimeout: 1, handler: nil)
    }

}

extension XCTestCase {

    func login() {
        let app = XCUIApplication()

        let loginButton = app.buttons["LoginButton"]
        let loginSuccessLink = app.links["強制的にログイン成功"]
        loginButton.tap()
        loginSuccessLink.tap()
    }
}
