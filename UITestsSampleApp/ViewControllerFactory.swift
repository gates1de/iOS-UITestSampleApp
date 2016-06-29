//
//  ViewControllerFactory.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/25/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import UIKit

final class ViewControllerFactory {

    private enum StoryboardName: String {
        case Main = "Main"
        case Login = "Login"
        case Calculator = "Calculator"
        case PostalCodeSearch = "PostalCodeSearch"
    }

    enum MainClassName: String {
        case WelcomeViewController = "WelcomViewController"
    }
    
    enum LoginClassName: String {
        case LoginViewController = "LoginViewController"
        case SelectFeatureTableViewController = "SelectFeatureTableViewController"
    }

    enum CalculatorClassName: String {
        case CalculatorViewController = "CalculatorViewController"
    }

    enum PostalCodeSearchClassName: String {
        case PostalCodeSearchViewController = "PostalCodeSearchViewController"
    }



    // MARK: Main

    class func welcomeViewController() -> WelcomeViewController {
        return UIStoryboard(name: StoryboardName.Main.rawValue, bundle: nil).instantiateViewController(withIdentifier: MainClassName.WelcomeViewController.rawValue) as! WelcomeViewController
    }

    class func selectFeatureTableViewController() -> SelectFeatureTableViewController {
        return UIStoryboard(name: StoryboardName.Login.rawValue, bundle: nil).instantiateViewController(withIdentifier: LoginClassName.SelectFeatureTableViewController.rawValue) as! SelectFeatureTableViewController
    }

    // MARK: Login

    class func loginViewController() -> LoginViewController {
        return UIStoryboard(name: StoryboardName.Login.rawValue, bundle: nil).instantiateViewController(withIdentifier: LoginClassName.LoginViewController.rawValue) as! LoginViewController
    }

    // MARK: Calculator
    
    class func calculatorViewController() -> CalculatorViewController {
        return UIStoryboard(name: StoryboardName.Calculator.rawValue, bundle: nil).instantiateViewController(withIdentifier: CalculatorClassName.CalculatorViewController.rawValue) as! CalculatorViewController
    }

    // MARK: PostalCodeSearch

    class func postalCodeSearchViewController() -> PostalCodeSearchViewController {
        return UIStoryboard(name: StoryboardName.PostalCodeSearch.rawValue, bundle: nil).instantiateViewController(withIdentifier: PostalCodeSearchClassName.PostalCodeSearchViewController.rawValue) as! PostalCodeSearchViewController
    }
    
}
