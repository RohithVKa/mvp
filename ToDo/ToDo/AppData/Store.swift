//
//  Store.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 27/02/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation
class Store {
    static let shared = Store()
    private init() {
    }
    
    var users = [User]()
//    var data = [User:[ToDo]]()
    
//    var todos: [ToDo] {
//        if let currentUser = user {
//            if let todos = data[currentUser] {
//                return todos
//            }
//        }
//        return []
//    }
//    var todos: [ToDo] = []
    var user: User? 
    
}
