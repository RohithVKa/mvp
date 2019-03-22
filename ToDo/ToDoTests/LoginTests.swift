//
//  LoginTests.swift
//  ToDoTests
//
//  Created by eCOM-vijay.m3 on 31/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import XCTest
@testable import ToDo
class LoginTests: XCTestCase {
    var mockLoginView:LoginViewInterface?
    var result:Any = "Define Result for each test. It is mandatory"
    
    let tests = [
        
        // Nil tests
        ["userName":nil, "password":nil, "result":"UserName is not valid!","class": MockLoginViewController1.self],
        ["userName":"1", "password":nil, "result": "Password is not valid!","class": MockLoginViewController1.self],
        ["userName":nil, "password":"1", "result": "UserName is not valid!","class": MockLoginViewController1.self],

        //Both are empty
        ["userName":"", "password":"", "result":"UserName is not valid!","class": MockLoginViewController1.self],

        // Invalid user name
        ["userName":"   ", "password":"1", "result": "UserName is not valid!","class": MockLoginViewController1.self],
        ["userName":"   \n", "password":"1", "result": "UserName is not valid!","class": MockLoginViewController1.self],
        ["userName":"\n", "password":"1", "result": "UserName is not valid!","class": MockLoginViewController1.self],

        // Invalid password with spaces
        ["userName":"1", "password":"   ", "result": "Password is not valid!","class": MockLoginViewController1.self],
        ["userName":"1", "password":"   \n", "result": "Password is not valid!","class": MockLoginViewController1.self],
        ["userName":"1", "password":"\n", "result": "Password is not valid!","class": MockLoginViewController1.self],

        // Invalid user name & password
        ["userName":"024", "password":"1", "result": "Please try again!","class": MockLoginViewController1.self],
        ["userName":"1", "password":"3454", "result": "Please try again!","class": MockLoginViewController1.self],
        ["userName":"45", "password":"677", "result": "Please try again!","class": MockLoginViewController1.self],
        
        // Valid credentials
        ["userName":"1", "password":"1", "class": MockLoginViewController1.self],
//        ["userName":"45", "password":"677", "result": "Please try again!","class": MockLoginViewController1.self],

    ]
    
    override func setUp() {
        self.mockLoginView = nil
        self.result = "Define Result for each test."
        Store.shared.users = [User(userName: "1", password: "1", fullName: "1", phoneNumber: "1")]
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

        super.tearDown()
    }
    
    
    func test() {
//        var all = [XCTestExpectation]()s
        for test in self.tests {
            if let currentTest = test["class"] as? MockCommonLoginViewController.Type {
                let userName = test["userName"] ?? "nil"
                let password = test["password"] ?? "nil"
                
                let expec = expectation(description: "userName:\(String(describing: userName))::password:\(String(describing: password))")
                if let result = test["result"] {
                    self.result = result as Any
                } else {
                    self.result = "Define Result for each test."
                }
                self.mockLoginView = currentTest.init(expect: expec, result: self.result)
                
                let loginPresenter = LoginPresenter(view: mockLoginView!)
                loginPresenter.login(userName: test["userName"] as? String, password: test["password"] as? String)
                wait(for: [expec], timeout: 3)

//                all.append(expec)
                
            }
        }
//        wait(for: all, timeout: 60)
    }
}

class MockCommonLoginViewController: LoginViewInterface {

    var expect:XCTestExpectation
    var result:Any
    
    required init(expect:XCTestExpectation, result:Any) {
        self.expect = expect
        self.result = result
    }
  
    func loggedIn() {
        
    }
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }
    
    func showErrorMessage(message: String?) {
        
    }
    
    func hideErrorMessage() {
        
    }
    
}

class MockLoginViewController1: MockCommonLoginViewController {
    
    override func showErrorMessage(message: String?) {
        XCTAssertEqual(message, (self.result as! String), self.expect.description)
        self.expect.fulfill()
    }
    
    override func loggedIn() {
        self.expect.fulfill()
    }
}

