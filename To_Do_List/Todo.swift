//
//  Todo.swift
//  To_Do_List
//
//  Created by DWizard11 on 25/6/22.
//

import Foundation

struct Todo: Identifiable {
    
    let id = UUID()
    
    var title : String
    var isCompleted : Bool = false
    
}
