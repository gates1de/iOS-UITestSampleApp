//
//  SelectFeatureTableViewControllerUITests.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/26/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import XCTest

class SelectFeatureTableViewControllerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSelectFeatureTableViewCellCounts() {
        let app = XCUIApplication()

        let cells = app.cells.matching(.cell, identifier: "ReuseIdentifier")

        login()

        // 画面遷移時間を考慮
        expectation(for: Predicate(format: "count == 2"), evaluatedWith: cells, handler: nil)
        waitForExpectations(withTimeout: 1, handler: nil)
    }

    func testDismissSelectFeatureTableView() {
        let app = XCUIApplication()

        let cell = app.cells.matching(.cell, identifier: "ReuseIdentifier").element(boundBy: 1)

        login()

        cell.tap()

        expectation(for: Predicate(format: "exists == false"), evaluatedWith: cell, handler: nil)
        waitForExpectations(withTimeout: 1, handler: nil)
    }
    
}
