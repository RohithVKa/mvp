//
//  ToDoListPresenter.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation

class ToDoListPresenter {
    weak var view: ToDoListViewInterface?
    fileprivate var toDoListUseCase = ToDoListUseCase()
    required init(view:ToDoListViewInterface) {
        self.view = view
    }
}

extension ToDoListPresenter: ToDoListPresenterInterface {
    
    private func modifyToDo(toDo: ToDo?) {
        self.view?.showLoader()
        self.view?.hideErrorMessage()
        self.toDoListUseCase.updateToDo(todo: toDo) { (success) in
            self.view?.hideLoader()
            if success {
                self.view?.listUpdated()
            }
        }
    }
    
    func deleteToDo(toDo: ToDo?) {
        guard let toDo = toDo else { self.view?.showErrorMessage(message: "can not be deleted"); return }
        
        self.view?.showLoader()
        self.view?.hideErrorMessage()
        self.toDoListUseCase.deleteToDo(todo: toDo) { (success) in
            self.view?.hideLoader()
            if success {
                self.view?.listUpdated()
            }
        }
    }
    
    func checkToDo(toDo: ToDo?) {
        guard let toDo = toDo else { self.view?.showErrorMessage(message: "can not be checked"); return }
        
        toDo.state = .finished
        self.modifyToDo(toDo: toDo)
    }
    
    func unCheckToDo(toDo: ToDo?) {
        guard let toDo = toDo else { self.view?.showErrorMessage(message: "can not be unchecked"); return }
        
        toDo.state = .unfinished
        self.modifyToDo(toDo: toDo)

    }
    
    func updateToDo(toDo: ToDo?) {
        guard let toDo = toDo else { self.view?.showErrorMessage(message: "can not be updated"); return }
        
        self.modifyToDo(toDo: toDo)
    }
    
    func addToDo(toDo: String?) {
        guard let toDo = toDo else { self.view?.showErrorMessage(message: "can not be added"); return }
        
        if toDo.isEmpty{
            self.view?.showErrorMessage(message: "todo's caption can't be blank")
            return
        }

        self.view?.showLoader()
        self.view?.hideErrorMessage()
        self.toDoListUseCase.addToDo(todo: ToDo(toDo, date: Date().timeIntervalSince1970)) { (success) in
            self.view?.hideLoader()
            if success {
                self.view?.listUpdated()
            }
        }
    }
    
    func logout() {
        Store.shared.user = nil
        Router.shared.performAction(action: Router.Action.SHOW_LOGIN.rawValue)
    }
    
}
