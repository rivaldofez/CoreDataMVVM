//
//  ContentView.swift
//  CoreDataMVVM
//
//  Created by Rivaldo Fernandes on 20/08/22.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject private var taskListViewModel = TaskListViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter Task Name", text: $taskListViewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save"){
                    taskListViewModel.save()
                }
            }
            
            List(0...20, id: \.self){
                index in
                Text("\(index)")
            }
            
            
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
