//
//  AuthViewController.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/4/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

public class AuthViewController: UIViewController {
    
    // UI elements
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    @IBOutlet private weak var authAction: UIButton!
    
    // Data
    private var launcher: Launcher!
    private var needSpinner = true
    
    public init(_ launcher: Launcher) {
        self.launcher = launcher
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        if needSpinner {
            authAction.isHidden = true
            spinner.startAnimating()
            needSpinner = false
        } else {
            authAction.isHidden = false
            spinner.stopAnimating()
        }
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareActionButton()
    }
    
    private func prepareActionButton() {
        authAction.addTarget(self, action: #selector(authActionTapped), for: .touchUpInside)
    }
    
    @objc private func authActionTapped() {
        launcher.wakeup()
    }
}
