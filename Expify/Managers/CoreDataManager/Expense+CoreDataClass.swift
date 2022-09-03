//
//  Expense+CoreDataClass.swift
//  
//
//  Created by Alex173 on 03.09.2022.
//
//

import Foundation
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    convenience init() {
        
        let entity = NSEntityDescription.entity(forEntityName: "Expense", in: CoreDataManager.instance.managedObjectContext)
        
        self.init(entity: entity!, insertInto: CoreDataManager.instance.managedObjectContext)
    }
}
