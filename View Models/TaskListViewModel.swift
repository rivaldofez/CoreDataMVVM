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
    
    func save() {
        //save the task
        
        let task = Task(context: CoreDataManager.shared.viewContext)
        task.title = title
        
        CoreDataManager.shared.save()
    }
}
