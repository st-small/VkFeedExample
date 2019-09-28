//
//  Launcher.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 9/28/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

final public class Launcher {
    
    public var window: UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        window.rootViewController = vc
        vc.view.backgroundColor = .yellow
        window.makeKeyAndVisible()
        
        return window
    }
}
