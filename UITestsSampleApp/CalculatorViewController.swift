//
//  CalculatorViewController.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/25/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var rootLabel: UILabel!
    @IBOutlet weak var squareLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func calculate(_ sender: UIButton) {
        if let rootNumber = Double(textField.text!) {
            rootLabel.text = "\(sqrt(rootNumber))"
        }

        if let squareNumber = Double(textField.text!) {
            squareLabel.text = "\(pow(squareNumber, 2))"
        }
    }
    
}
