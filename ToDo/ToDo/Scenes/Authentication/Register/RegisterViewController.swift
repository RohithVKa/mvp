//
//  RegisterViewController.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import UIKit




public class RegisterViewController: UIViewController {
    var presenter: RegisterPresenterInterface?
    
    // View
    @IBOutlet weak var userName: UITextField?
    @IBOutlet weak var password: UITextField?
    @IBOutlet weak var fullName: UITextField?
    @IBOutlet weak var phoneNumber: UITextField?
    
    @IBOutlet weak var errorMessage: UILabel?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = RegisterPresenter(view: self as RegisterViewInterface)
    }

    @IBAction func registerDidTap(_ sender: Any) {
        self.view.endEditing(true)
        self.presenter?.register(userName: self.userName?.text, password: self.password?.text, fullName: self.fullName?.text, phoneNumber: self.phoneNumber?.text)
    }
    
}

extension RegisterViewController: RegisterViewInterface {
    
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
    func registered() {
        Router.shared.performAction(action: Router.Action.REGISTER_SUCCESS.rawValue)
    }
    
}
