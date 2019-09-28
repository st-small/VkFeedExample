//
//  AppDelegate.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 9/28/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit
import VKSdkFramework

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let launcher = Launcher()
        window = launcher.window
        
        return true
    }
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        return true
    }
}

