//
//  LoginViewController.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import UIKit




public class LoginViewController: UIViewController {
    var presenter: LoginPresenterInterface?
    
    // View
    @IBOutlet weak var userName: UITextField?
    @IBOutlet weak var password: UITextField?
    @IBOutlet weak var errorMessage: UILabel?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LoginPresenter(view: self as LoginViewInterface)        
    }
    
    @IBAction func loginDidTap(_ sender: Any) {
        self.view.endEditing(true)
        presenter?.login(userName: self.userName?.text, password: self.password?.text)
    }
    
    @IBAction func registerDidTap(_ sender: Any) {
        self.view.endEditing(true)
        presenter?.register()
    }
    
}
extension LoginViewController: LoginViewInterface {
    // MARK: App level interface
    func showErrorMessage(message: String?) {
        self.errorMessage?.text = message
    }
    func hideErrorMessage() {
        self.errorMessage?.text = nil
    }
    
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }
    
    // MARK: User level interface
    func loggedIn() {
        Router.shared.performAction(action: Router.Action.LOGIN_SUCCESS.rawValue)
    }
    
}
