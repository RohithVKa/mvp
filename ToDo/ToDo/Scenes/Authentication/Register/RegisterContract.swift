//
//  RegisterContract.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

protocol RegisterViewInterface: AnyObject, Loadable, ErrorDisplayable {
    func registered()
}

protocol RegisterPresenterInterface: AnyObject {
    func register(userName:String?, password:String?,fullName:String?,phoneNumber:String?)
}


