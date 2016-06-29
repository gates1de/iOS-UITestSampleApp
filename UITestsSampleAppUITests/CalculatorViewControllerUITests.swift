//
//  CalculatorViewControllerUITests.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/28/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import XCTest

class CalculatorViewControllerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCalculation() {
        let app = XCUIApplication()

        let cell = app.cells.matching(.cell, identifier: "ReuseIdentifier").element(boundBy: 0)
        let textField = app.textFields["NumberTextField"]
        let calculateButton = app.buttons["Calculate"]
        let rootResult = app.staticTexts["RootResult"]
        let squareResult = app.staticTexts["SquareResult"]

        login()

        cell.tap()
        textField.tap()
        textField.typeText("256")
        calculateButton.tap()

        XCTAssertTrue(rootResult.label == "16.0")
        XCTAssertTrue(squareResult.label == "65536.0")
    }

}
