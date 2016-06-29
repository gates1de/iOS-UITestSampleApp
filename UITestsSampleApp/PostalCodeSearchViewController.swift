//
//  PostalCodeSearchViewController.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/26/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import UIKit

class PostalCodeSearchViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.accessibilityIdentifier = "PostalCodeSearchNavigationBar"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func search(_ sender: UIButton) {
        let session = URLSession.shared()
        let task = session.dataTask(with: URL(string: "http://zipcloud.ibsnet.co.jp/api/search?zipcode=\(textField.text!)")!, completionHandler: { [unowned self] (data, response, error) in

            DispatchQueue.main.sync(execute: {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)

                    if let status = json["status"] as? Int where status == 200 {
                        if let results = json["results"] as? Array<AnyObject>, result = results[0] as? Dictionary<String, String> {
                            self.resultLabel.text = "\(result["address1"]!)\(result["address2"]!)\(result["address3"]!)"
                            return
                        }
                    }

                    self.resultLabel.text = "Not found"
                } catch {
                    self.resultLabel.text = "Parse error"
                }
            })

        })

        task.resume()
    }
}
