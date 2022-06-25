//
//  ContentView.swift
//  To_Do_List
//
//  Created by DWizard11 on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
   @State var todos = [
    Todo(title: "Watch some Paw Patrol", details: "Episodes 5 and 6",
            isCompleted: true),
        Todo(title: "Conduct Giveaway"),
        Todo(title: "Slap some people"),
    ]
    
    
    var body: some View {
        NavigationView {
            List($todos) { $todo in
                NavigationLink{
                    TodoDetailView(todo: $todo)
                } label: {
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        VStack (alignment: .leading){
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                        
                            if !todo.details.isEmpty{
                                Text(todo.details)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }.foregroundColor(todo.isCompleted ? .green : .red)
                }
            }
            .navigationTitle("To-Do List")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
