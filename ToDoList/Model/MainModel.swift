//
//  MainModel.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import CoreData

class MainModel {
	
	private var models = [ToDoListItem]()
	
	private var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "ToDoList")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()
	
	func getAllTasks() {
		do {
			models = try persistentContainer.viewContext.fetch(ToDoListItem.fetchRequest())
		}
		catch {
			print("Cant get all tasks!")
		}
	}
	
	func createTask(with name: String) {
		let newItem = ToDoListItem(context: persistentContainer.viewContext)
		newItem.name = name
		newItem.dateCreate = Date()
		newItem.isCompleted = false
		do {
			try persistentContainer.viewContext.save()
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
	
	func updateNameTask(item: ToDoListItem, newName: String) {
		item.name = newName
		do {
			try persistentContainer.viewContext.save()
		}
		catch {
			print("Cant update")
		}
	}
	
	func updateTasks() {
		do {
			try persistentContainer.viewContext.save()
		}
		catch {
			print("Cant update")
		}
	}
	
	func getCountModels() -> Int {
		return models.count
	}
	
	func getModelItem(at index: Int) -> ToDoListItem {
		return models[index]
	}
	
	func getTask(with name: String) -> ToDoListItem {
		for model in models {
			if model.name == name {
				return model
			}
		}
		return ToDoListItem()
	}
	
	func updateIsComplete(with name: String) {
		let temp = getTask(with: name)
		if temp.isCompleted == false {
			temp.isCompleted = true
		}
		else {
			temp.isCompleted = false
		}
	}
}
