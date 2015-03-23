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
    var row: Int? = nil
    var _url: NSURL?
    var url: NSURL?  {
        set(newURL) {
            _url = newURL
            if let u = newURL {
                webView.loadRequest(NSURLRequest(URL: u))
                label.text = u.absoluteString
                label.sizeToFit()
                setNeedsLayout()
                row.map {
                    NSUserDefaults.standardUserDefaults().setURL(u, forKey: WebViewCell.keyForIndex($0))
                }
            }
            else {
                webView.stopLoading()
            }
        }
        get {
            return _url
        }
    }

    class func keyForIndex(index: Int) -> String {
        return "rtd_key_\(index)"
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        webView.userInteractionEnabled = false
        webView.suppressesIncrementalRendering = true
        webView.allowsInlineMediaPlayback = true
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

    deinit {
        webView.delegate = nil
        webView.stopLoading()
    }

    override func prepareForReuse() {
        webView.delegate = nil
        webView.stopLoading()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        webView.frame = CGRectInset(self.bounds, 5, 5)
        label.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
    }

    func reload() {
        webView.reload()
        backgroundColor = UIColor.magentaColor()
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.backgroundColor = UIColor.whiteColor()
        })

    }



}
