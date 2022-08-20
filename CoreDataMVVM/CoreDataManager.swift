//
//  CoreDataManager.swift
//  CoreDataMVVM
//
//  Created by Rivaldo Fernandes on 20/08/22.
//

import Foundation
import CoreData
import SwiftUI


//initializing core data
class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager() //singleton
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getAllTask() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
           return try viewContext.fetch(request)
        }catch{
            return []
        }
    }
    
    func deleteTask(task: Task) {
        viewContext.delete(task)
        save()
    }
    
    func getTaskById(id: NSManagedObjectID) -> Task? {
        do {
            return try viewContext.existingObject(with: id) as? Task
        } catch {
            return nil
        }
        
    }
    
    func save() {
        do {
            try viewContext.save()
        }catch{
            viewContext.rollback()
            print(error.localizedDescription)
        }
        
    }
    
    private init() { // private, not available outside this claass
        persistentContainer = NSPersistentContainer(name: "TodoAppModel")
        persistentContainer.loadPersistentStores{(description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
}
