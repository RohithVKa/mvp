//
//  RegisterViewController.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import UIKit




public class ToDoListViewController: UIViewController {
    var presenter: ToDoListPresenterInterface?
    private let reuseIdentifier = "ToDoCollectionViewCell"
    @IBOutlet weak var errorMessage: UILabel?

    @IBOutlet weak var toDoListCollectionView: UICollectionView?
    weak var confirmAction : UIAlertAction?

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = ToDoListPresenter(view: self as ToDoListViewInterface)
    }

    @IBAction func addToDo(_ sender: Any) {
        self.view.endEditing(true)
        presentToDo()
    }

    @IBAction func logout(_ sender: Any) {
        self.view.endEditing(true)
        self.presenter?.logout()
    }
    
    func presentToDo(todo: ToDo? = nil) {
        var title:String = "New ToDo"
        var button = "Add"
        
        if let todo = todo {
            title = "Editing:" + todo.caption
            button = "Save"
        }
        
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: button, style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                let trimmedText = text.spacesTrimmed
                if let todo = todo {
                    todo.caption = trimmedText
                    self.presenter?.updateToDo(toDo: todo)
                } else {
                    self.presenter?.addToDo(toDo: trimmedText)
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "E.g., Buy Milk"
            textField.clearButtonMode = .whileEditing
            textField.enablesReturnKeyAutomatically = true
            textField.returnKeyType = .done
            textField.autocapitalizationType = .sentences
            textField.addTarget(self, action: #selector(self.textChanged(_:)), for: .editingChanged)
        }
        alertController.addAction(confirmAction)
        self.confirmAction = confirmAction
        self.confirmAction?.isEnabled  = false
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func textChanged(_ sender:UITextField) {
        if let text = sender.text,text.isNonSpace {
            self.confirmAction?.isEnabled  = true
        } else {
            self.confirmAction?.isEnabled  = false
        }
    }
    
}
extension ToDoListViewController: ToDoListViewInterface {
    
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
    func listUpdated() {
        self.toDoListCollectionView?.reloadData()
    }

}

extension ToDoListViewController: UICollectionViewDataSource {
  
    @objc func editTodo(_ sender:UIButton) {
        self.presentToDo(todo: Store.shared.user?.todos[sender.tag])
    }
    
    @objc func deleteTodo(_ sender:UIButton) {
        self.presenter?.deleteToDo(toDo: Store.shared.user?.todos[sender.tag])
    }
    
    @objc func markOrUnmarkTodo(_ sender:UIButton) {
        if let todoToBeUpdated = Store.shared.user?.todos[sender.tag] {
            if todoToBeUpdated.state == .finished {
                self.presenter?.unCheckToDo(toDo: todoToBeUpdated)
            } else {
                self.presenter?.checkToDo(toDo: todoToBeUpdated)
            }
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! ToDoCollectionViewCell
        if let todo = Store.shared.user?.todos[indexPath.row] {
            cell.loadToDo(todo: todo)
            cell.editButton?.tag = indexPath.row
            cell.deleteButton?.tag = indexPath.row
            cell.markButton?.tag = indexPath.row
            cell.editButton?.addTarget(self, action: #selector(self.editTodo(_:)))
            cell.deleteButton?.addTarget(self, action: #selector(self.deleteTodo(_:)))
            cell.markButton?.addTarget(self, action: #selector(self.markOrUnmarkTodo(_:)))
        }

        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Store.shared.user?.todos.count ?? 0
    }
    
    
}
