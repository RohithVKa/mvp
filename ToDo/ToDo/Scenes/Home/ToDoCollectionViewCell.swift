//
//  ToDoCollectionViewCell.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 27/02/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import UIKit

class ToDoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var caption: UILabel?
    @IBOutlet weak var date: UILabel?
    @IBOutlet weak var editButton: UIButton?
    @IBOutlet weak var deleteButton: UIButton?
    @IBOutlet weak var markButton: UIButton?
    
    func loadToDo(todo:ToDo) {
        self.date?.text = todo.date.toDateString()
        
        if todo.state == .finished {
            self.caption?.attributedText = todo.caption.strikedString()
            self.markButton?.thumbsUpButton()
        } else{
            self.caption?.attributedText = todo.caption.attributedString
            self.markButton?.pointerButton()
        }
        
    }

}
