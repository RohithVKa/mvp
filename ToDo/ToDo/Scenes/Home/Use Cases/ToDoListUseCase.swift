//
//  RegisterUseCase.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

class ToDoListUseCase {
    
    func addToDo(todo:ToDo?, completion:(Bool)->Void) {
        guard let todo = todo else { return  completion(false)}
//        let sha = Store.shared
//          sha.data[sha.user!]!.append(todo)
        Store.shared.user?.todos.append(todo)
        completion(true)
    }
    
    func updateToDo(todo:ToDo?, completion:(Bool)->Void) {
        guard let todo = todo else { return  completion(false)}
        
        let index = Store.shared.user?.todos.firstIndex { (currentToDo) -> Bool in
            return todo === currentToDo
        }
        if let index = index {
            Store.shared.user?.todos[index] = todo
            return completion(true)
        }
        completion(false)
    }
    
    func deleteToDo(todo:ToDo?, completion:(Bool)->Void) {
        guard let todo = todo else { return  completion(false)}
        
        let index = Store.shared.user?.todos.firstIndex { (currentToDo) -> Bool in
            return todo === currentToDo
        }
        if let index = index {
            Store.shared.user?.todos.remove(at: index)
            return completion(true)
        }
        completion(false)
    }
}
