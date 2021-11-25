//
//  ToDoListItems+CoreDataProperties.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//
//

import Foundation
import CoreData


extension ToDoListItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItems> {
        return NSFetchRequest<ToDoListItems>(entityName: "ToDoListItems")
    }

    @NSManaged public var name: String?
    @NSManaged public var dateCreate: Data?

}
