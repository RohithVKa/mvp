//
//  ToDo.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 27/02/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

class ToDo {
    
    enum State {
        case finished
        case unfinished
    }
    
    var caption:String
    var date:TimeInterval
    var state: State = .unfinished
    
    init(_ caption:String, date:TimeInterval) {
        self.caption = caption
        self.date = date
    }
}

