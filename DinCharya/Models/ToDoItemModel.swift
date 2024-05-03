//
//  ToDoItemModel.swift
//  DinCharya
//
//  Created by Ganpat Jangir on 03/05/24.
//

import Foundation

struct ToDoItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompletedTask: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompletedTask: Bool) {
        self.id = id
        self.title = title
        self.isCompletedTask = isCompletedTask
    }
    
    func updateTask() -> ToDoItemModel{
        return ToDoItemModel(id: self.id, title: self.title, isCompletedTask: !self.isCompletedTask)
    }
}
