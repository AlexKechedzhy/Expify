//
//  Category+CoreDataClass.swift
//  
//
//  Created by Alex173 on 03.09.2022.
//
//

import Foundation
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    convenience init() {
        
        let entity = NSEntityDescription.entity(forEntityName: "Category", in: CoreDataManager.instance.managedObjectContext)
        
        self.init(entity: entity!, insertInto: CoreDataManager.instance.managedObjectContext)
    }
}
