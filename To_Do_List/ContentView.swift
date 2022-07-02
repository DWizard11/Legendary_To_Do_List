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
    
    @State var isSheetGiven = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach($todos) { $todo in
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
                .onDelete { indexSet in
                    todos.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    todos.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button  {
                        isSheetGiven = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
        .sheet(isPresented: $isSheetGiven) {
            NewTodoView(todos: $todos)
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
