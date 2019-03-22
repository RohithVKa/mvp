//
//  LoginPresenter.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

class LoginPresenter {
    weak var view: LoginViewInterface?
    fileprivate var loginUseCase = LoginUseCase()
    
    required init(view:LoginViewInterface) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenterInterface {
    
    private func showErrorMessage(message:String) {
        self.view?.hideLoader()
        self.view?.showErrorMessage(message: message)
    }
   
    func login(userName: String?, password: String?) {
        
        self.view?.showLoader()
        self.view?.hideErrorMessage()

        do {
            try self.loginUseCase.login(userName: userName, password: password, onSuccess:{ user in
                self.view?.hideLoader()
                Store.shared.user = user
                self.view?.loggedIn()
            })
        } catch LoginUseCase.LoginError.UserNameIsNotValid {
            self.showErrorMessage(message: "UserName is not valid!")
        } catch LoginUseCase.LoginError.PasswordIsNotValid {
            self.showErrorMessage(message: "Password is not valid!")
        } catch LoginUseCase.LoginError.UserNotAuthenticated {
            self.showErrorMessage(message: "Please try again!")
        } catch {
            self.showErrorMessage(message: "Something went wrong! Please try again later!")
        }
        
    }
    
    func register() {
        Router.shared.performAction(action: Router.Action.SHOW_REGISTER.rawValue)
    }
    
    
}
