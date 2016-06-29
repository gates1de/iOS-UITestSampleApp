//
//  SelectFeatureTableViewController.swift
//  UITestsSampleApp
//
//  Created by Yu Kadowaki on 6/23/16.
//  Copyright © 2016 gates1de. All rights reserved.
//

import UIKit

class SelectFeatureTableViewController: UITableViewController {

    let featureTextArray = ["Square Root Calculator", "Postal Code Search"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featureTextArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = featureTextArray[indexPath.row]

        return cell
    }
    
}
