//
//  AuthService.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 9/28/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation
import VKSdkFramework

final public class AuthService: NSObject {
    
    // Data
    private let appId = "7151795"
    private let vkSdk: VKSdk
    
    public override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
}

extension AuthService: VKSdkDelegate {
    public func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
    }
    
    public func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
}

extension AuthService: VKSdkUIDelegate {
    public func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
    }
    
    public func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
