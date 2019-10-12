//
//  FooterView.swift
//  VkFeedExample
//
//  Created by Станислав Шияновский on 10/12/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import Foundation
import UIKit

public class FooterView: UIView {
    
    private var myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = #colorLiteral(red: 0.631372549, green: 0.6470588235, blue: 0.662745098, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        return loader
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(myLabel)
        addSubview(loader)
        
        let labelInsets = UIEdgeInsets(top: 8, left: 20, bottom: 777, right: 20)
        myLabel.anchor(top: topAnchor,
                       leading: leadingAnchor,
                       bottom: nil,
                       trailing: trailingAnchor,
                       padding: labelInsets)
        
        loader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loader.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    public func showLoader() {
        loader.startAnimating()
    }
    
    public func setTitle(_ title: String?) {
        loader.stopAnimating()
        myLabel.text = title
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
