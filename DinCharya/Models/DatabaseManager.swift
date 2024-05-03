//
//  DatabaseManager.swift
//  DinCharya
//
//  Created by Ganpat Jangir on 03/05/24.
//

import Foundation

class DatabaseManager {
    
    private let itemsKey = Constants.dataBaseKey
    
    func saveItemToDatabase(items: [ToDoItemModel]) {
        if let encodatedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodatedData, forKeyPath: itemsKey)
        }
    }
    
    func getItemsFromDatabase(completion:@escaping([ToDoItemModel])->Void) {
        if let data = UserDefaults.standard.data(forKey: itemsKey), let items = try? JSONDecoder().decode([ToDoItemModel].self, from: data){
            completion(items)
        }
    }
}
