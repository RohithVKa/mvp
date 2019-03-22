//
//  User.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 15/03/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

class User: Hashable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.userName == rhs.userName && lhs.password == rhs.password && lhs.fullName == rhs.fullName && lhs.phoneNumber == rhs.phoneNumber
    }
    
    
    
    var userName: String
    var password: String
    var fullName: String
    var phoneNumber: String
    var todos:[ToDo] = []
    
    required init(userName: String, password: String, fullName: String, phoneNumber: String) {
        self.userName = userName
        self.password = password
        self.fullName = fullName
        self.phoneNumber = phoneNumber
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.userName)
        hasher.combine(self.password)
        hasher.combine(self.fullName)
        hasher.combine(self.phoneNumber)
    }
}
