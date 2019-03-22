//
//  Date+Extensions.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 01/03/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func toDateString(dateformat formatType: String = "MMM d, h:mm a") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatType
        let newDateString: String = dateFormatter.string(from: Date(timeIntervalSince1970: self))
        return newDateString
    }
}

