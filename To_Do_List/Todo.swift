//
//  Todo.swift
//  To_Do_List
//
//  Created by DWizard11 on 25/6/22.
//

import Foundation

struct Todo: Identifiable, Codable {
    
    var id = UUID()
    
    var title : String
    var details = ""
    var isCompleted : Bool = false
    var priority : Int = 0 
    
}
