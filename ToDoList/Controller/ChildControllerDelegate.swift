//
//  ChildControllerDelegate.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/26/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation

protocol ChildControllerDelegate: AnyObject {
	func closeButtonDidTap()
	func saveButtonDidTap(taskName: String)
}
