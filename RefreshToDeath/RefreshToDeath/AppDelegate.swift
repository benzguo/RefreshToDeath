//
//  AppDelegate.swift
//  RefreshToDeath
//
//  Created by Ben Guo on 3/20/15.
//  Copyright (c) 2015 benzguo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSSetUncaughtExceptionHandler(exceptionHandlerPtr)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        let vc: ViewController = UIApplication.sharedApplication().delegate!.window!?.rootViewController as ViewController

        UIApplication.sharedApplication().delegate.map {
            $0.window.map { $0.map { ($0.rootViewController as ViewController).log("will resign active") } } }

        let url = NSURL(string: "orpheus://halp")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    func applicationDidEnterBackground(application: UIApplication) {
        UIApplication.sharedApplication().delegate.map {
            $0.window.map { $0.map { ($0.rootViewController as ViewController).log("did enter background") } } }

        let url = NSURL(string: "orpheus://halp")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    func applicationWillEnterForeground(application: UIApplication) {
        UIApplication.sharedApplication().delegate.map {
            $0.window.map { $0.map { ($0.rootViewController as ViewController).log("will enter foreground") } } }

    }

    func applicationDidBecomeActive(application: UIApplication) {
        UIApplication.sharedApplication().delegate.map {
            $0.window.map { $0.map { ($0.rootViewController as ViewController).log("did become active") } } }
    }

    func applicationWillTerminate(application: UIApplication) {
        UIApplication.sharedApplication().delegate.map {
            $0.window.map { $0.map { ($0.rootViewController as ViewController).log("will terminate") } } }
        let url = NSURL(string: "orpheus://halp")
        url.map { UIApplication.sharedApplication().openURL($0) }
    }

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return true
    }


}

