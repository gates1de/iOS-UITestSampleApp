//
//  WelcomeViewController.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/23/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToLogin(_ sender: UIButton) {
        self.navigationController?.pushViewController(ViewControllerFactory.loginViewController(), animated: true)
    }
    
}

