//
//  TaskListViewModel.swift
//  CoreDataMVVM
//
//  Created by Rivaldo Fernandes on 20/08/22.
//

import Foundation
import CoreData

class TaskListViewModel: ObservableObject {
    var title: String = ""
    @Published var tasks: [TaskViewModel] = []
    
    
    func getAllTask() {
       tasks = CoreDataManager.shared.getAllTask().map(TaskViewModel.init)
    }
    
    func save() {
        //save the task
        
        let task = Task(context: CoreDataManager.shared.viewContext)
        task.title = title
        
        CoreDataManager.shared.save()
    }
}


struct TaskViewModel {
    let task: Task
    
    var id: NSManagedObjectID {
        return task.objectID
    }
    
    var title: String {
        return task.title ?? ""
    }
}
