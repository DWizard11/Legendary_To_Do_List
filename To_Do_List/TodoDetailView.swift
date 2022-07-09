//
//  TodoDetailView.swift
//  To_Do_List
//
//  Created by DWizard11 on 25/6/22.
//

import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        VStack{
            TextField("Enter your todo title here", text: $todo.title)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .padding()
            
            Button{
                withAnimation {
                    todo.isCompleted.toggle()
                }
            } label: {
                Text("Mark as \(todo.isCompleted ? "incomplete" : "complete")")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(todo.isCompleted ? .red : .green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            
            }
            Spacer()
            
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(Todo(title: "Water the Cat Demo")))
    }
}
