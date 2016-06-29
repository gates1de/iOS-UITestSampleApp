//
//  GradationView.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/23/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import UIKit

@IBDesignable class GradationView: UIView {

    @IBInspectable internal var topColor: UIColor = UIColor.white()
    @IBInspectable internal var bottomColor: UIColor = UIColor.black()

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.frame = self.bounds

        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
