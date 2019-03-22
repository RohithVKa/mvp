//
//  ViewInterface.swift
//  ToDo
//
//  Created by eCOM-vijay.m3 on 30/01/19.
//  Copyright © 2019 VijayAppleDevOrg. All rights reserved.
//

import Foundation
import UIKit

protocol Loadable {
    func showLoader()
    func hideLoader()
}

protocol ErrorDisplayable {
    func showErrorMessage(message: String?)
    func hideErrorMessage()
}
