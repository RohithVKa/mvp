//
//  RegisterTests.swift
//  ToDoTests
//
//  Created by eCOM-vijay.m3 on 31/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import XCTest
@testable import ToDo
class RegisterTests: XCTestCase {
    var mockRegisterView:RegisterViewInterface?
    var result:Any = "Define Result for each test. It is mandatory"
    
    let tests = [
        
        // Nil tests
        // All
        ["userName":nil, "password":nil, "fullName":nil, "phoneNumber":nil, "result":"UserName is not valid!","class": MockRegisterViewController1.self],
        
        // 1 at a time
        ["userName":"1", "password":nil, "fullName":nil, "phoneNumber":nil, "result": "Password is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":"1", "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":"1", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":nil, "phoneNumber":"1", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        
        // 2 at a time
        ["userName":"1", "password":"1", "fullName":nil, "phoneNumber":nil, "result": "Full Name is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":"1", "fullName":"1", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":"1", "phoneNumber":"1", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":"1", "password":nil, "fullName":nil, "phoneNumber":"1", "result": "Password is not valid!","class": MockRegisterViewController1.self],
        
        // 3 at a time
        ["userName":"1", "password":"1", "fullName":"1", "phoneNumber":nil, "result": "Phone Number is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":"1", "fullName":"1", "phoneNumber":"1", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":"1", "password":nil, "fullName":"1", "phoneNumber":"1", "result": "Password is not valid!","class": MockRegisterViewController1.self],
        ["userName":"1", "password":"1", "fullName":nil, "phoneNumber":"1", "result": "Full Name is not valid!","class": MockRegisterViewController1.self],
        
        // Valid
        ["userName":"31", "password":"1", "fullName":"1", "phoneNumber":"1","class": MockRegisterViewController1.self],

        
        
        
        // Spaces tests
        // All
        ["userName":"  ", "password":"  ", "fullName":"  ", "phoneNumber":"  ","result": "UserName is not valid!","class": MockRegisterViewController1.self],

        // 1 at a time
        ["userName":"  ", "password":nil, "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":"  ", "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":"  ", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":nil, "phoneNumber":"  ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],

        // 2 at a time
        ["userName":"  ", "password":"  ", "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":"  ", "fullName":"  ", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":"  ", "phoneNumber":"  ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":"  ", "password":nil, "fullName":nil, "phoneNumber":"  ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],

        // 3 at a time
        ["userName":"  ", "password":"  ", "fullName":"  ", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":"  ", "fullName":"  ", "phoneNumber":"  ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":"  ", "password":nil, "fullName":"  ", "phoneNumber":"  ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":"  ", "password":"  ", "fullName":nil, "phoneNumber":"  ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        
        
        
        
        // New line tests
        // All
        ["userName":"\n", "password":"\n", "fullName":"\n", "phoneNumber":"\n","result": "UserName is not valid!","class": MockRegisterViewController1.self],
        
        // 1 at a time
        ["userName":"\n", "password":nil, "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":"\n", "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":"\n", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":nil, "phoneNumber":"\n", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        
        // 2 at a time
        ["userName":"\n", "password":"\n", "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":"\n", "fullName":"\n", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":"\n", "phoneNumber":"\n", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":"\n", "password":nil, "fullName":nil, "phoneNumber":"\n", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        
        // 3 at a time
        ["userName":"\n", "password":"\n", "fullName":"\n", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":"\n", "fullName":"\n", "phoneNumber":"\n", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":"\n", "password":nil, "fullName":"\n", "phoneNumber":"\n", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":"\n", "password":"\n", "fullName":nil, "phoneNumber":"\n", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        
        
        

        // New line + Spaces tests
        // All
        ["userName":" \n ", "password":" \n ", "fullName":" \n ", "phoneNumber":" \n ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        
        // 1 at a time
        ["userName":" \n ", "password":nil, "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":" \n ", "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":" \n ", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":nil, "phoneNumber":" \n ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],

        // 2 at a time
        ["userName":" \n ", "password":" \n ", "fullName":nil, "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":" \n ", "fullName":" \n ", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":nil, "fullName":" \n ", "phoneNumber":" \n ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":" \n ", "password":nil, "fullName":nil, "phoneNumber":" \n ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],

        // 3 at a time
        ["userName":" \n ", "password":" \n ", "fullName":" \n ", "phoneNumber":nil, "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":nil, "password":" \n ", "fullName":" \n ", "phoneNumber":" \n ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":" \n ", "password":nil, "fullName":" \n ", "phoneNumber":" \n ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],
        ["userName":" \n ", "password":" \n ", "fullName":nil, "phoneNumber":" \n ", "result": "UserName is not valid!","class": MockRegisterViewController1.self],

        
        
        
        // Valid + New line + Spaces tests => will trim the New line and spaces and save only the valid string
        ["userName":"11 \n ", "password":"11 \n ", "fullName":"11 \n ", "phoneNumber":"11 \n ","class": MockRegisterViewController1.self],

        // Already registed
        ["userName":"1 \n ", "password":"1 \n ", "fullName":"1 \n ", "phoneNumber":"1 \n ","result": "You are already with us. Please Login!", "class": MockRegisterViewController1.self],

        ]
    
    override func setUp() {
        self.mockRegisterView = nil
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
        for test in self.tests {
            if let currentTest = test["class"] as? MockCommonRegisterViewController.Type {
                let userName = test["userName"] ?? "nil"
                let password = test["password"] ?? "nil"
                let fullName = test["fullName"] ?? "nil"
                let phoneNumber = test["phoneNumber"] ?? "nil"
                
                let expec = expectation(description: "userName:\(String(describing: userName))::password:\(String(describing: password))::fullName:\(String(describing: fullName))::phoneNumber:\(String(describing: phoneNumber))")
                if let result = test["result"] {
                    self.result = result as Any
                } else {
                    self.result = "Define Result for each test."
                }
                self.mockRegisterView = currentTest.init(expect: expec, result: self.result)
                
                let registerPresenter = RegisterPresenter(view: mockRegisterView!)
                registerPresenter.register(userName: test["userName"] as? String, password: test["password"] as? String, fullName: test["fullName"] as? String, phoneNumber: test["phoneNumber"] as? String)
                
                wait(for: [expec], timeout: 3)
            }
        }
    }
}

class MockCommonRegisterViewController: RegisterViewInterface {
    
    var expect:XCTestExpectation
    var result:Any
    
    required init(expect:XCTestExpectation, result:Any) {
        self.expect = expect
        self.result = result
    }
    
    func registered() {
        
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

class MockRegisterViewController1: MockCommonRegisterViewController {
    
    override func showErrorMessage(message: String?) {
        XCTAssertEqual(message, (self.result as! String), self.expect.description)
        self.expect.fulfill()
    }
    
    override func registered() {
        self.expect.fulfill()
    }
}
