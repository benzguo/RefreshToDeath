//
//  WebViewCell.swift
//  RefreshToDeath
//
//  Created by Ben Guo on 3/20/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

import UIKit

class WebViewCell: UITableViewCell {

    let webView = UIWebView()
    let label = UILabel()
    var url : (NSURL, Int) {
        set(tuple) {
            let request = NSURLRequest(URL: tuple.0)
            webView.loadRequest(request)
            label.text = tuple.0.absoluteString
            label.sizeToFit()
            setNeedsLayout()
            NSUserDefaults.standardUserDefaults().setURL(tuple.0, forKey: WebViewCell.keyForIndex(tuple.1))
        }
        get {
            return (NSURL(), 0)
        }
    }

    class func keyForIndex(index: Int) -> String {
        return "rtd_key_\(index)"
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        webView.userInteractionEnabled = false
        webView.mediaPlaybackRequiresUserAction = false
        contentView.addSubview(webView)
        contentView.addSubview(label)
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor(white: 0, alpha: 0.5)
        label.font = UIFont.boldSystemFontOfSize(15)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        webView.frame = self.bounds
        label.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
    }

}
