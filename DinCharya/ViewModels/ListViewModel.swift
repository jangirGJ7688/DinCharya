//
//  ListViewModel.swift
//  DinCharya
//
//  Created by Ganpat Jangir on 03/05/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ToDoItemModel] = [] {
        didSet {
            self.manager.saveItemToDatabase(items: self.items)
        }
    }
    
    private var manager: DatabaseManager
    
    init(_ databaseManager: DatabaseManager) {
        self.manager = databaseManager
        getItems()
    }
    
    func getItems() {
        self.manager.getItemsFromDatabase { [weak self] items in
            self?.items = items
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        self.items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from : IndexSet, to: Int) {
        self.items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let item = ToDoItemModel(title: title, isCompletedTask: false)
        self.items.append(item)
    }
    
    func markTaskDone(item: ToDoItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateTask()
        }
    }
}
