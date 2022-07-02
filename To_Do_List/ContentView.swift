//
//  ContentView.swift
//  To_Do_List
//
//  Created by DWizard11 on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
    
    
    @State var isSheetGiven = false
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($todoManager.todos) { $todo in
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
                    todoManager.todos.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    todoManager.todos.move(fromOffsets: indices, toOffset: newOffset)
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
            NewTodoView(todos: $todoManager.todos)
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
