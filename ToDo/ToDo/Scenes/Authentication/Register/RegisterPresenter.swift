//
//  RegisterPresenter.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

class RegisterPresenter {
    weak var view: RegisterViewInterface?
    fileprivate var registerUseCase = RegisterUseCase()
    
    required init(view:RegisterViewInterface) {
        self.view = view
    }
}

extension RegisterPresenter: RegisterPresenterInterface {
    
    private func showErrorMessage(message:String) {
        self.view?.hideLoader()
        self.view?.showErrorMessage(message: message)
    }

    func register(userName: String?, password: String?, fullName: String?, phoneNumber: String?) {
        self.view?.showLoader()
        self.view?.hideErrorMessage()
        
        do {
            try self.registerUseCase.register(userName: userName, password: password, fullName: fullName, phoneNumber: phoneNumber, onSuccess: { user in
                Store.shared.user = user
                self.view?.hideLoader()
                self.view?.registered()
            })
        } catch RegisterUseCase.RegisterError.UserNameIsNotValid {
            self.showErrorMessage(message: "UserName is not valid!")
        } catch RegisterUseCase.RegisterError.PasswordIsNotValid {
            self.showErrorMessage(message: "Password is not valid!")
        } catch RegisterUseCase.RegisterError.FullNameIsNotValid {
            self.showErrorMessage(message: "Full Name is not valid!")
        } catch RegisterUseCase.RegisterError.PhoneNumberIsNotValid {
            self.showErrorMessage(message: "Phone Number is not valid!")
        } catch RegisterUseCase.RegisterError.AlreadyRegistered {
            self.showErrorMessage(message: "You are already with us. Please Login!")
        } catch {
            self.showErrorMessage(message: "Something went wrong! Please try again later!")
        }

    }
    
}
