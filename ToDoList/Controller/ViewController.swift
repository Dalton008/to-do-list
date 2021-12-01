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
	
	private var requestToModel = MainModel()
	
	private let transition = PanelTransition()
	
	let tableView: UITableView = {
		let table = UITableView()
		table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		return table
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		self.navigationItem.title = "Tasks"
		self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "appetite-italic", size: 24) ?? UIFont.systemFont(ofSize: 20)]
		let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
		button.tintColor = .purple
		self.navigationItem.rightBarButtonItem = button
		
		view.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.frame = view.bounds
		tableView.separatorStyle = .none
		getAllTasks()
	}

	@objc private func didTapAdd() {
		let child = AddTaskViewController()
		child.transitioningDelegate = transition
		child.modalPresentationStyle = .custom
		child.delegate = self
		present(child, animated: true)
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
		requestToModel.updateNameTask(item: item, newName: newName)
		getAllTasks()
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return requestToModel.getCountModels()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let task = requestToModel.getModelItem(at: indexPath.row)
		let cell = CustomTableViewCell(id: "\(indexPath.row)", text: task.name)
		
		cell.changeCompleteButton(tag: indexPath.row)
		cell.addTargetCompleteButton(target: self, action: #selector(didTapCompleteButton))
		cell.setTitleCompleteButton(title: task.name)
		if task.isCompleted == false {
			cell.setImageCompleteButton(image: UIImage(named: "circle")!)
			cell.setSelectedCompleteButton(isSelected: false)
		}
		else {
			cell.setImageCompleteButton(image: UIImage(named: "done")!)
			cell.setSelectedCompleteButton(isSelected: true)
		}
		return cell
	}

	@objc private func didTapCompleteButton(button: UIButton) {
		if button.isSelected == false {
			button.isSelected = true
			button.setImage(UIImage(named: "done"), for: .normal)
			requestToModel.updateIsComplete(with: button.currentTitle ?? "task name")
			requestToModel.updateTasks()
		}
		else {
			button.isSelected = false
			button.setImage(UIImage(named: "circle"), for: .normal)
			requestToModel.updateIsComplete(with: button.currentTitle ?? "task name")
			requestToModel.updateTasks()
		}
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

extension ViewController: SaveTaskToModelDelegate {
	
	func saveTask(with name: String) {
		createTask(with: name)
		getAllTasks()
	}
}
