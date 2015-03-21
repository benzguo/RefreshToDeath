//
//  AppDelegate.swift
//  Orpheus
//
//  Created by Ben Guo on 3/21/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSSetUncaughtExceptionHandler(exceptionHandlerPtr)

        let url = NSURL(string: "refresh2d://arise")
        url.map { UIApplication.sharedApplication().openURL($0) }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        let url = NSURL(string: "refresh2d://arise")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    func applicationDidEnterBackground(application: UIApplication) {
        let url = NSURL(string: "refresh2d://arise")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    func applicationWillEnterForeground(application: UIApplication) {
        let url = NSURL(string: "refresh2d://arise")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    func applicationDidBecomeActive(application: UIApplication) {
        let url = NSURL(string: "refresh2d://arise")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    func applicationWillTerminate(application: UIApplication) {
        let url = NSURL(string: "refresh2d://arise")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return true
    }


}

