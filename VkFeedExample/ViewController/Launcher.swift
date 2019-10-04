//
//  Launcher.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 9/28/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

final public class Launcher {
    
    private var window: UIWindow?
    private var authService: AuthService!
    
    public init(_ window: UIWindow?) {
        self.window = window
        authService = AuthService(self)

        prepareStartView()
    }
    
    public func wakeup() {
        authService.wakeupSession()
    }
    
    private func prepareStartView() {
        let vc = AuthViewController(self)
        window?.rootViewController = vc
        
        wakeup()
    }
}

extension Launcher: AuthServiceDelegate {
    public func authServiceShouldShow(_ viewController: UIViewController) {
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    public func authServiceSignIn() {
        let feedVC = FeedViewController()
        let nav = UINavigationController(rootViewController: feedVC)
        window?.rootViewController?.present(nav, animated: true, completion: nil)
    }
    
    public func authServiceDidSignInFail() {
        
    }
}
