//
//  RegisterContract.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

protocol ToDoListViewInterface: AnyObject, Loadable, ErrorDisplayable {
    func listUpdated()
}

protocol ToDoListPresenterInterface: AnyObject {
    func addToDo(toDo: String?)
    func updateToDo(toDo: ToDo?)
    func deleteToDo(toDo: ToDo?)
    func checkToDo(toDo: ToDo?)
    func unCheckToDo(toDo: ToDo?)
    func logout()
}


