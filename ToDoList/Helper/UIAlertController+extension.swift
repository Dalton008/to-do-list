//
//  UIAlertController+extension.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/26/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

//MARK: - for fix actionSheet
extension UIAlertController {
	
	override open func viewDidLoad() {
		super.viewDidLoad()
		pruneNegativeWidthConstraints()
	}

	func pruneNegativeWidthConstraints() {
		for subView in self.view.subviews {
			for constraint in subView.constraints where constraint.debugDescription.contains("width == - 16") {
				subView.removeConstraint(constraint)
			}
		}
	}
}
