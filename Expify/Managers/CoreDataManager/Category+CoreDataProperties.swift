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
    @NSManaged public var expenses: NSSet?
    
}

extension Category {

    @objc(addExpenseObject:)
    @NSManaged public func addExpenseObject(_ value: Expense)

    @objc(removeExpenseObject:)
    @NSManaged public func removeExpenseObject(_ value: Expense)

    @objc(addExpenses:)
    @NSManaged public func addExpenses(_ values: NSSet)

    @objc(removeExpenses:)
    @NSManaged public func removeExpenses(_ values: NSSet)

}

extension Category : Identifiable {

}
