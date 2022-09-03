//
//  Category+CoreDataProperties.swift
//  
//
//  Created by Alex173 on 03.09.2022.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var dateCreated: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?

}
