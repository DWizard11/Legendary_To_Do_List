//
//  NewTodoView.swift
//  To_Do_List
//
//  Created by DWizard11 on 2/7/22.
//

import SwiftUI

struct NewTodoView: View {
    
    @State var todoTitle = ""
    @Binding var todos: [Todo]
    @Environment(\.dismiss) var dismiss
    
    // This method is an older version 
//    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            TextField("Task name", text: $todoTitle)
            
            Button("Save Todo"){
                let todo = Todo(title: todoTitle)
                todos.append(todo)
                dismiss()
//                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(todos: .constant([]))
    }
}
