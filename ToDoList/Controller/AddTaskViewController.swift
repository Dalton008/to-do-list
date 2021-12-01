//
//  ChildViewController.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/26/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
	
	private var childView = AddTaskView()
	
	weak var delegate: SaveTaskToModelDelegate?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		childView.delegate = self
		addChildView()
	}
	
	private func addChildView() {
		self.view.setupConstraints(label: childView, topAnchor: view.topAnchor, botAnchor: view.bottomAnchor, leftAnchor: view.leadingAnchor, rightAnchor: view.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
	}
}

extension AddTaskViewController: AddTaskControllerDelegate {

	func closeButtonDidTap() {
		self.dismiss(animated: true, completion: nil)
	}
	
	func saveButtonDidTap(taskName: String) {
		delegate?.saveTask(with: taskName)
		self.dismiss(animated: true, completion: nil)
	}
}
