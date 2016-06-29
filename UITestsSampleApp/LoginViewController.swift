//
//  LoginViewController.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/24/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    let targetURL = Bundle.main().pathForResource("index", ofType: "html")

    override func viewDidLoad() {
        super.viewDidLoad()

        let reqURL = URL(string: targetURL!)
        let req = NSURLRequest(url: reqURL!)
        webView.delegate = self
        webView.loadRequest(req as URLRequest)
    }

    @IBAction func selectedFeature(segue: UIStoryboardSegue) {
        if let selectFeatureTableViewController = segue.sourceViewController as? SelectFeatureTableViewController, selectedIndexPath = selectFeatureTableViewController.tableView.indexPathForSelectedRow {

            DispatchQueue.main.after(when: .now() + 0.5, execute: {
                switch selectedIndexPath.row {
                case 0:
                    self.navigationController?.pushViewController(ViewControllerFactory.calculatorViewController(), animated: true)
                    break
                case 1:
                    self.navigationController?.pushViewController(ViewControllerFactory.postalCodeSearchViewController(), animated: true)
                    break
                default:
                    break
                }
            })

        }
    }
}

extension LoginViewController: UIWebViewDelegate {

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {

        let queryItems = NSURLComponents(url: request.url!, resolvingAgainstBaseURL: false)?.queryItems

        queryItems?.forEach { [unowned self] queryItem in
            if queryItem.name == "statusCode" && queryItem.value == "200" {
                self.present(ViewControllerFactory.selectFeatureTableViewController(), animated: true, completion: nil)
                return
            }
        }

        return true
    }

}
