//
//  RegisterUseCase.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

class RegisterUseCase {
    enum RegisterError: Error {
        case UserNameIsNotValid
        case PasswordIsNotValid
        case FullNameIsNotValid
        case PhoneNumberIsNotValid
        case AlreadyRegistered
    }
    
    func register(userName:String?, password:String?,fullName:String?,phoneNumber:String?, onSuccess:(User) -> Void) throws {
        if String.isEmptied(text: userName) {
            throw RegisterError.UserNameIsNotValid
        }
        
        if String.isEmptied(text: password) {
            throw RegisterError.PasswordIsNotValid
        }
        
        if String.isEmptied(text: fullName) {
            throw RegisterError.FullNameIsNotValid
        }
        
        if String.isEmptied(text: phoneNumber) {
            throw RegisterError.PhoneNumberIsNotValid
        }
        
        let user = Store.shared.users.first(where: { (user) -> Bool in
            return user.userName == userName?.spacesTrimmed
        })

        if user != nil {
            throw RegisterError.AlreadyRegistered
        }
        
        let newUser = User(userName: userName!.spacesTrimmed, password: password!.spacesTrimmed, fullName: fullName!.spacesTrimmed, phoneNumber: phoneNumber!.spacesTrimmed)
        
        Store.shared.users.append(newUser)

        return onSuccess(newUser)
    }
}
