//
//  ViewController.swift
//  4sqAPIKitHimotoki
//
//  Created by koogawa on 2016/05/29.
//  Copyright © 2016 koogawa. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UITableViewController {

    var venues = [Venue]() {
        didSet {
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = GetVenueList()

        Session.sendRequest(request) { response in
            switch response {

            case .Success(let responses):
                self.venues = responses.venues

            case .Failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.venues.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let venue = venues[indexPath.row]
        cell.textLabel?.text = venue.name

        return cell
    }
}

