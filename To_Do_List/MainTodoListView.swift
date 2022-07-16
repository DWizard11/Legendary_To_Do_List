//
//  ContentView.swift
//  To_Do_List
//
//  Created by DWizard11 on 25/6/22.
//

import SwiftUI

struct MainTodoListView: View {
    
    @State var isSheetGiven = false
    @ObservedObject var todoManager: TodoManager
    @AppStorage("username") var name = ""
    
    var body: some View {
        NavigationView {
            List {
                TextField("Enter your name", text: $name)
                ForEach($todoManager.todos) { $todo in
                    NavigationLink{
                        TodoDetailView(todo: $todo)
                    } label: {
                        HStack {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
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
                .onMove { originalOffset, newOffset in
                    todoManager.todos.move(fromOffsets: originalOffset, toOffset: newOffset)
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


struct MainTodoListView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView(todoManager: TodoManager())
    }
}
