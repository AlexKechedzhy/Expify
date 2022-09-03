//
//  Expence+CoreDataProperties.swift
//  
//
//  Created by Alex173 on 03.09.2022.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var amount: Double
    @NSManaged public var dateCreated: Date?
    @NSManaged public var id: UUID?

}
