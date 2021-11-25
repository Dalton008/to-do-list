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
	
	private var requestToModel = MainModel()
	
	let tableView: UITableView = {
		let table = UITableView()
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return table
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		self.navigationItem.title = "Tasks"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
//		self.view.setupConstraints(label: mainView, topAnchor: view.topAnchor, botAnchor: view.bottomAnchor, leftAnchor: view.leadingAnchor, rightAnchor: view.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 0, trailingConst: 0, heightConst: nil, widthConst: nil)
		
		view.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.frame = view.bounds
		getAllTasks()
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
	
	private func getAllTasks() {
		requestToModel.getAllTasks()
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	private func createTask(with name: String) {
		requestToModel.createTask(with: name)
		getAllTasks()
	}
	
	private func removeTask(item: ToDoListItem) {
		requestToModel.removeTask(item: item)
		getAllTasks()
	}
	
	private func updateTask(item: ToDoListItem, newName: String) {
		requestToModel.updateTask(item: item, newName: newName)
		getAllTasks()
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return requestToModel.getCountModels()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = requestToModel.getModelItem(at: indexPath.row)
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = "\(model.name)"
		return cell
	}
	 
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let item = requestToModel.getModelItem(at: indexPath.row)
		let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
		sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in

			let alert = UIAlertController(title: "Edit task", message: "Edit task", preferredStyle: .alert)
			alert.addTextField(configurationHandler: nil)
			alert.textFields?.first?.text = item.name
			alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in
				guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
					return
				}
				self?.updateTask(item: item, newName: newName)
			}))
			self.present(alert, animated: true)
		}))
		sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
			self?.removeTask(item: item)
		}))
		present(sheet, animated: true)
	}
	
	
}
