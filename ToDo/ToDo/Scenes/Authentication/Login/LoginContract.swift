//
//  LoginContract.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

protocol LoginViewInterface: AnyObject, Loadable, ErrorDisplayable {
    func loggedIn()
}

protocol LoginPresenterInterface: AnyObject {
    func login(userName:String?, password:String?)
    func register()
}


