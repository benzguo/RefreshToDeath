//
//  ViewController.swift
//  RefreshToDeath
//
//  Created by Ben Guo on 3/20/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview1: UIWebView!
    @IBOutlet weak var webview2: UIWebView!
    @IBOutlet weak var label: UILabel!

    var timer : NSTimer? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        NSURLCache.sharedURLCache().removeAllCachedResponses()

        let url1: NSURL = NSURL(string: "http://netsadness.net")!
        let request1 = NSURLRequest(URL: url1)
        let url2: NSURL = NSURL(string: "http://benzguo.com")!
        let request2 = NSURLRequest(URL: url2)

        webview1.loadRequest(request1)
        webview1.mediaPlaybackRequiresUserAction = false
        webview2.loadRequest(request2)
        webview2.mediaPlaybackRequiresUserAction = false

        timer = NSTimer.scheduledTimerWithTimeInterval(40, target: self, selector: "reload", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        label.text = "memory warning"
        NSURLCache.sharedURLCache().removeAllCachedResponses()
    }

    func reload() {
        let r = arc4random_uniform(2)
        print(r)
        if r == 0 {
            webview1.reload()
        }
        else if r == 1 {
            webview2.reload()
        }

    }

}

