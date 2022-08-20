//
//  CoreDataManager.swift
//  CoreDataMVVM
//
//  Created by Rivaldo Fernandes on 20/08/22.
//

import Foundation
import CoreData


//initializing core data
class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager() //singleton
    
    
    private init() { // private, not available outside this claass
        persistentContainer = NSPersistentContainer(name: "TodoAppModel")
        persistentContainer.loadPersistentStores{(description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
}
