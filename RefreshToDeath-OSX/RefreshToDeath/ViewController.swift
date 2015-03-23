//
//  ViewController.swift
//  RefreshToDeath
//
//  Created by Ben Guo on 3/22/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var wv1: WebView!
    @IBOutlet weak var wv2: WebView!
    @IBOutlet weak var wv3: WebView!
    @IBOutlet weak var wv4: WebView!
    @IBOutlet weak var wv5: WebView!

    @IBOutlet weak var b1: NSButton!
    @IBOutlet weak var b2: NSButton!
    @IBOutlet weak var b3: NSButton!
    @IBOutlet weak var b4: NSButton!
    @IBOutlet weak var b5: NSButton!

    var buttonToWebView : [NSButton: WebView]?

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonToWebView =
        [
            b1: wv1,
            b2: wv2,
            b3: wv3,
            b4: wv4,
            b5: wv5,
        ]
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func buttonClick(sender: AnyObject) {
        let wv = buttonToWebView![sender as NSButton]
    }

}

