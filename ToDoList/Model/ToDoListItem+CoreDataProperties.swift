//
//  ToDoListItem+CoreDataProperties.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//
//

import Foundation
import CoreData

extension ToDoListItem {

	@nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
		return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
	}

	@NSManaged public var dateCreate: Date
	@NSManaged public var name: String
	@NSManaged public var isCompleted: Bool
}
