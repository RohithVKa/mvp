//
//  Router.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation
import UIKit
class Router {
    static let shared = Router()
    private init() {
        
    }

    enum Action: String {
        case LAUNCH
        case SHOW_LOGIN
        case LOGIN_SUCCESS
        case SHOW_REGISTER
        case REGISTER_SUCCESS
    }

    var navigationController: UINavigationController?
    var window: UIWindow?
    
    func performAction(action: String, withData data: [String:Any]? = nil) {
        switch action {
            case Action.LAUNCH.rawValue:
                self.showLoginOrDashboard(withData: data)
            case Action.SHOW_LOGIN.rawValue:
                self.showLogin(withData: data)
            case Action.LOGIN_SUCCESS.rawValue:
                self.showToDoList(withData: data)
            case Action.SHOW_REGISTER.rawValue:
                self.showRegister(withData: data)
            case Action.REGISTER_SUCCESS.rawValue:
                self.showToDoList(withData: data)
            default:
                return
        }
    }

    func showLoginOrDashboard(withData data:[String: Any]?=nil) {
        self.performAction(action: Router.Action.SHOW_LOGIN.rawValue)
    }

    
    func showLogin(withData data:[String: Any]?=nil) {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        self.navigationController = UINavigationController(rootViewController: LoginViewController.instantiate())
        window?.rootViewController = self.navigationController
        window?.makeKeyAndVisible()
    }

    func showToDoList(withData data:[String: Any]?=nil) {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        self.navigationController = UINavigationController(rootViewController: ToDoListViewController.instantiate() )
        window?.rootViewController = self.navigationController
        window?.makeKeyAndVisible()
    }

    func showRegister(withData data:[String: Any]?=nil) {
        let registerVC = RegisterViewController.instantiate()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
}
