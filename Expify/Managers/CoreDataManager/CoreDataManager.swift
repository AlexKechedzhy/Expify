//
//  CoreDataManager.swift
//  Expify
//
//  Created by Alex173 on 03.09.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static public let instance = CoreDataManager()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let viewContext = persistentContainer.viewContext
        viewContext.automaticallyMergesChangesFromParent = true
        return viewContext
    }()

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
    
    func configureCategoryResultsController(delegate: NSFetchedResultsControllerDelegate) -> NSFetchedResultsController<Category>? {
        let request = NSFetchRequest<Category>(entityName: "Category")
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: request,
                                                          managedObjectContext: persistentContainer.viewContext,
                                                          sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = delegate
        do {
            try fetchResultController.performFetch()
            return fetchResultController
        } catch {
            print(error)
            return nil
        }
    }

}
