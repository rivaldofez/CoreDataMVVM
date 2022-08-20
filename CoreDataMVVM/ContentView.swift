//
//  ContentView.swift
//  CoreDataMVVM
//
//  Created by Rivaldo Fernandes on 20/08/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject private var taskListViewModel = TaskListViewModel()
    
    func deleteTask(at offsets: IndexSet){
        offsets.forEach{ index in
            let task = taskListViewModel.tasks[index]
            taskListViewModel.delete(task)
        }
        taskListViewModel.getAllTask()
    }
    
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter Task Name", text: $taskListViewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save"){
                    withAnimation{
                        taskListViewModel.save()
                        taskListViewModel.getAllTask()
                    }
                    
                    
                }
            }
            
//            List(taskListViewModel.tasks, id: \.id){
//                task in
//                Text(task.title)
//            }
            
            List {
                ForEach(taskListViewModel.tasks, id: \.id) { task in
                    Text(task.title)
                }.onDelete(perform: deleteTask)
            }
            
            
            Spacer()
        }.padding()
            .onAppear{
                taskListViewModel.getAllTask()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
