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
	
	func updateTask(item: ToDoListItem, newName: String) {
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
}
