//
//  LoginUseCase.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

class LoginUseCase {
    
    enum LoginError: Error {
        case UserNameIsNotValid
        case PasswordIsNotValid
        case UserNotAuthenticated
    }
    
    func login(userName:String?, password:String?, onSuccess: (User) -> Void) throws {
        
        if String.isEmptied(text: userName) {
            throw LoginError.UserNameIsNotValid
        }
        
        if String.isEmptied(text: password) {
            throw LoginError.PasswordIsNotValid
        }
        
        let user = Store.shared.users.first(where: { (user) -> Bool in
            return user.userName == userName && user.password == password
        })

        if (user != nil) {
            return onSuccess(user!)
        }
        

        throw LoginError.UserNotAuthenticated

    }
}
