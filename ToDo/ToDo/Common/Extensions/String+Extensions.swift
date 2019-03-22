//
//  String+Extensions.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 01/03/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//


import UIKit


extension String {
    
    static func isEmptied(text:String?) -> Bool {
        if let text = text {
            return text.spacesTrimmed.count == 0
        }
        return true
    }
    
    static func count(text:String?) -> Int {
       
        if !String.isEmptied(text: text) {
            return text!.spacesTrimmed.count
        }
        
        return 0
    }
    

    
    func strikedString(color:UIColor = .red) -> NSAttributedString {
        let attrString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.strikethroughColor: color])
        return attrString;
    }
    
    var attributedString:NSAttributedString {
        return NSAttributedString(string: self)
    }
    
    var spacesTrimmed:String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var isNonSpace:Bool {
        return self.spacesTrimmed.count > 0
    }

}

