//
//  ViewController.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
	
	private var mainView = MainView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		self.navigationItem.title = "Tasks"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
		
		self.view.setupConstraints(label: mainView, topAnchor: view.topAnchor, botAnchor: view.bottomAnchor, leftAnchor: view.leadingAnchor, rightAnchor: view.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
		
	}

	func getAllTasks() {
		
	}
	
	func createTask(name: String) {

	}
	
	func removeTask(item: ToDoListItem) {
		
	}
	
	func updateTask(item: ToDoListItem) {
		
	}
	
}

