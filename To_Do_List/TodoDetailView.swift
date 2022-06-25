//
//  TodoDetailView.swift
//  To_Do_List
//
//  Created by DWizard11 on 25/6/22.
//

import SwiftUI

struct TodoDetailView: View {
    
    @State var todo = Todo(title: "Water the cat")
    
    var body: some View {
        VStack{
            TextField("Todo title", text: $todo.title)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .padding()
            
            Button{
                todo.isCompleted.toggle()
            } label: {
                Text("Mark as \(todo.isCompleted ? "incomplete" : "complete")")
            }
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView()
    }
}
