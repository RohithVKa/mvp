//
//  UIButton+Extensions.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 01/03/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import UIKit

extension UIButton {
    
    func pointerButton() {
        self.setTitle("\u{1F449}", for: .normal)
        self.setTitle("\u{1F449}", for: .highlighted)
    }
    
    func thumbsUpButton() {
        self.setTitle("\u{1F44D}", for: .normal)
        self.setTitle("\u{1F44D}", for: .highlighted)
    }
    
    func addTarget(_ target: Any?, action: Selector) {
        self.addTarget(target, action: action, for: .touchUpInside)
    }
    

}
