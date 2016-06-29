//
//  WelcomeViewControllerUITests.swift
//  UITestsSampleAppUITests
//
//  Created by Yu Kadowaki on 6/23/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import XCTest

class WelcomeViewControllerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsExistsLoginButton() {
        let app = XCUIApplication()

        let loginButton = app.buttons["LoginButton"]

        XCTAssertTrue(loginButton.exists)
    }
    
}
