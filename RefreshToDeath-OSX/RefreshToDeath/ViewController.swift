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
    @IBOutlet weak var wv6: WebView!
    @IBOutlet weak var wv7: WebView!

    @IBOutlet weak var tf1: NSTextField!
    @IBOutlet weak var tf2: NSTextField!
    @IBOutlet weak var tf3: NSTextField!
    @IBOutlet weak var tf4: NSTextField!
    @IBOutlet weak var tf5: NSTextField!
    @IBOutlet weak var tf6: NSTextField!
    @IBOutlet weak var tf7: NSTextField!

    var textFieldToWebView : [NSTextField: WebView]?
    var webViews: [WebView]?
    var textFields: [NSTextField]?
    var indices: [Int] = []

    func shuffle(xs: [Int]) -> [Int] {
        var ys = xs
        for i in stride(from: xs.count - 1, to: 0, by:-1) {
            let j = Int(arc4random_uniform(UInt32(i)))
            let ys_i = ys[i]
            ys[i] = ys[j]
            ys[j] = ys_i
        }
        return ys
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.blackColor().CGColor

        textFieldToWebView =
            [ tf1: wv1, tf2: wv2, tf3: wv3, tf4: wv4, tf5: wv5, tf6: wv6, tf7: wv7 ]
        webViews = [wv1, wv2, wv3, wv4, wv5, wv6, wv7]
        textFields = [tf1, tf2, tf3, tf4, tf5, tf6, tf7]
        for tf in textFields! {
            let key = keyForTextField(tf)
            let url = NSUserDefaults.standardUserDefaults().URLForKey(key)
            if let u = url {
                let wv = textFieldToWebView![tf]
                wv!.mainFrame.loadRequest(NSURLRequest(URL: u))
                u.absoluteString.map { tf.stringValue = $0 }
            }
        }

        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "reload", userInfo: nil, repeats: true)
    }

    func keyForTextField(textField: NSTextField) -> String {
        let index = find(textFields!, textField)
        return "RTDURL\(index)"
    }

    func reload() {
        let count = webViews!.count
        if indices.count == 0 {
            indices = shuffle([Int](0..<7))
            NSURLCache.sharedURLCache().removeAllCachedResponses()
            for tf in textFields! {
                tf.textColor = NSColor.whiteColor()
            }
        }
        let i = indices.last!
        indices.removeLast()

        let wv = webViews![i]
        wv.reload(self)
        let tf = textFields![i]
        tf.textColor = NSColor.greenColor()
    }

    @IBAction func textFieldEnter(sender: AnyObject) {
        resignFirstResponder()
        let tf = sender as NSTextField
        let wv = textFieldToWebView![tf]
        let url = NSURL(string: tf.stringValue)
        if let u = url {
            wv!.mainFrame.loadRequest(NSURLRequest(URL: u))
            let key = keyForTextField(tf)
            NSUserDefaults.standardUserDefaults().setURL(u, forKey: key)
            u.absoluteString.map { tf.stringValue = $0 }
        }
    }
}

