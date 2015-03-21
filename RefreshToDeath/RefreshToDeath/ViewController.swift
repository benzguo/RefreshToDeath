//
//  ViewController.swift
//  RefreshToDeath
//
//  Created by Ben Guo on 3/20/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let reuseId = "webViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(WebViewCell.self, forCellReuseIdentifier: reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: WebViewCell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as WebViewCell
        let url = NSUserDefaults.standardUserDefaults().URLForKey(WebViewCell.keyForIndex(indexPath.row))
        url.map { cell.url = ($0, indexPath.row) }
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        var textField = UITextField()
        let ac = UIAlertController(title: "Set URL", message: nil, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler:
            { action in
                let cell = tableView.cellForRowAtIndexPath(indexPath) as WebViewCell
                let url = NSURL(string: textField.text)
                url.map { cell.url = ($0, indexPath.row) }
        }))
        ac.addTextFieldWithConfigurationHandler {
            tf in
            tf.textAlignment = .Center
            tf.font = UIFont(name: "Helvetica-Neue", size: 25);
            tf.keyboardType = .URL
            textField = tf
        }
        self.presentViewController(ac, animated: true, completion: nil)

    }


}

