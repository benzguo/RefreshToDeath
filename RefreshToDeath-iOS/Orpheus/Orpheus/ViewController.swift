//
//  ViewController.swift
//  Orpheus
//
//  Created by Ben Guo on 3/21/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        arise()
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "awake", userInfo: nil, repeats: true)
    }
    
    func arise() {
        let url = NSURL(string: "refresh2d://arise")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

