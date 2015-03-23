//
//  WebViewItem.swift
//  RefreshToDeath
//
//  Created by Ben Guo on 3/22/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

import Cocoa
import WebKit

class WebViewItem: NSCollectionViewItem {

    @IBOutlet weak var label: NSTextField!
    @IBOutlet weak var webView: WebView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
