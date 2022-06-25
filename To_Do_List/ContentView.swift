//
//  ContentView.swift
//  To_Do_List
//
//  Created by DWizard11 on 25/6/22.
//

import SwiftUI

struct ContentView: View {
    
   @State var todos = [
        Todo(title: "Watch some Paw Patrol"),
        Todo(title: "Conduct Giveaway"),
        Todo(title: "Slap some people"),
    ]
    
    var body: some View {
        List(todos) { todo in
            Text(todo.title)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
