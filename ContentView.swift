//
//  ContentView.swift
//  To_Do_List
//
//  Created by DWizard11 on 9/7/22.
//
import SwiftUI

struct ContentView: View {
        
    @StateObject var todoManager = TodoManager()
    
    var body: some View {
        TabView {
            MainTodoListView(todoManager: todoManager)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle.fill")
                }
            Text("\(todoManager.todos.count) undone todos")
                .tabItem {
                    Label("Number of undone todos", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
