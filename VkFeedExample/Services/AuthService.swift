//
//  AuthService.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 9/28/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation
import VKSdkFramework

public protocol AuthServiceDelegate: class {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}

final public class AuthService: NSObject {
    
    public static let shared = AuthService()
    
    // Data
    public var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    public var userId: String? {
        return VKSdk.accessToken()?.userId
    }
    private let appId = "7151795"
    private let vkSdk: VKSdk
    
    public weak var delegate: AuthServiceDelegate!
    
    private override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    public func wakeupSession() {
        let scope = ["wall", "friends"]
        
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            if state == VKAuthorizationState.authorized {
                print("VKAuthorizationState.authorized")
                delegate?.authServiceSignIn()
            } else if state == VKAuthorizationState.initialized {
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            } else {
                let description = error?.localizedDescription ?? ""
                print("auth problems, state \(state), error  \(description)")
                delegate?.authServiceDidSignInFail()
            }
        }
    }
    
}

extension AuthService: VKSdkDelegate {
    public func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        
        if result.token != nil {
            delegate.authServiceSignIn()
        }
    }
    
    public func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate.authServiceDidSignInFail()
    }
}

extension AuthService: VKSdkUIDelegate {
    public func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate.authServiceShouldShow(controller)
    }
    
    public func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
