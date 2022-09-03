//
//  CoreDataManager.swift
//  Expify
//
//  Created by Alex173 on 03.09.2022.
//

import Foundation
import CoreData

class CoreDataManager {

    lazy var persistentContainer: NSPersistentContainer = {
        let container: NSPersistentContainer
        if CloudKitManager().isCloudKitEnabled() {
            container  = NSPersistentCloudKitContainer(name: "Expify")
        } else {
            container = NSPersistentContainer(name: "Expify")
            let description = container.persistentStoreDescriptions.first
            description?.setOption(true as NSNumber,
                                   forKey: NSPersistentHistoryTrackingKey)
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
