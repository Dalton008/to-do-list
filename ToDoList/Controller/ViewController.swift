//
//  ViewController.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ViewController: UIViewController {
	
	private var mainView = MainView()
	
	let tableView: UITableView = {
		let table = UITableView()
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return table
	}()
	
	private var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "ToDoList")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
	
	private var models = [ToDoListItem]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		self.navigationItem.title = "Tasks"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
		getAllTasks()
		self.view.setupConstraints(label: mainView, topAnchor: view.topAnchor, botAnchor: view.bottomAnchor, leftAnchor: view.leadingAnchor, rightAnchor: view.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
		
		view.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.frame = view.bounds
	}

	@objc private func didTapAdd() {
		let alert = UIAlertController(title: "New task", message: "Add new task", preferredStyle: .alert)
		
		alert.addTextField(configurationHandler: nil)
		alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
			guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
				return
			}
			self?.createTask(with: text)
		}))
		present(alert, animated: true)
	}
	
	func getAllTasks() {
		do {
			models = try persistentContainer.viewContext.fetch(ToDoListItem.fetchRequest())
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
		catch {
			print("Cant get all tasks!")
		}
	}
	
	func createTask(with name: String) {
		let newItem = ToDoListItem(context: persistentContainer.viewContext)
		newItem.name = name
		newItem.dateCreate = Date()
		
		do {
			try persistentContainer.viewContext.save()
			getAllTasks()
		}
		catch {
			print("Cant create task!")
		}
	}
	
	func removeTask(item: ToDoListItem) {
		persistentContainer.viewContext.delete(item)
		
		do {
			try persistentContainer.viewContext.save()
		}
		catch {
			print("Cant remove this task")
		}
	}
	
	func updateTask(item: ToDoListItem, newName: String) {
		item.name = newName
		
		do {
			try persistentContainer.viewContext.save()
		}
		catch {
			print("Cant update")
		}
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return models.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = models[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = model.name
		return cell
	}
	
	
}
