//
//  ViewController.swift
//  RefreshToDeath
//
//  Created by Ben Guo on 3/20/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

import UIKit
import AVFoundation

func crash() {
    let a = []
    let b: AnyObject = a[1]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    let reuseId = "webViewCell"
    var timer : NSTimer?
    var numberOfRows = 5
    var lastRow : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)

        tableView.registerClass(WebViewCell.self, forCellReuseIdentifier: reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView(frame: CGRectMake(0, 0, 100, 200))

        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "reload", userInfo: nil, repeats: true)
    }

    func reload() {
        let rand : Int = Int(arc4random_uniform(UInt32(numberOfRows)))
        if rand >= 0 && rand < numberOfRows && rand != lastRow {
            let indexPath = NSIndexPath(forRow: rand, inSection: 0)
            let cell = self.tableView.cellForRowAtIndexPath(indexPath) as WebViewCell
            cell.row = rand
            let url = NSUserDefaults.standardUserDefaults().URLForKey(WebViewCell.keyForIndex(indexPath.row))
            if cell.url != url {
                cell.url = url
            }
            else {
                cell.reload()
            }
            lastRow = rand
            log("reloaded row \(rand)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        view.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
        UIView.animateWithDuration(2, animations: {
            self.view.backgroundColor = UIColor.whiteColor()
        })
        log("received memory warning")
        let url = NSURL(string: "orpheus://halp")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: WebViewCell = tableView.dequeueReusableCellWithIdentifier(reuseId, forIndexPath: indexPath) as WebViewCell
        cell.row = indexPath.row
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
                cell.row = indexPath.row
                let url = NSURL(string: textField.text)
                url.map { cell.url = $0 }
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

    func log(text: String) {
        if (textView.text.utf16Count > 1000) {
            self.textView.text = text
        }
        else {
            textView.text = text + "\n" + textView.text
        }
    }

}

