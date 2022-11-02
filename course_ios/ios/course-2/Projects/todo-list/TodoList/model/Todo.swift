//
//  Todo.swift
//  TodoList
//
//  Created by Sadaf Fatin on 3/28/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import Foundation


struct Todos : Codable{
    
    let items : Array<Todo>
    
}


struct Todo : Codable{
    
    let item: String
    let priority: Int
    
}
