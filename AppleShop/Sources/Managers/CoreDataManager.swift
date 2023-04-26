//
//  CoreDataManager.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import Foundation
import CoreData

// MARK: CoreData
class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    var users: [User] = []
    var items: [Item] = []
    
    init() {
        container = NSPersistentContainer(name: "AppleShopProjectApp")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
        
        self.users = fetchUsers()
        self.items = fetchItems()
    }
}


// MARK: Functions User
extension CoreDataManager {
    
    func fetchUsers() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            let users = try context.fetch(request)
            return users
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    //func fetching items
    func fetchItems() -> [Item] {
        let request = NSFetchRequest<Item>(entityName: "Item")
        
        do {
            let items = try context.fetch(request)
            return items
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func addUser(username: String, password: String) {
        let newUser = User(context: context)
        newUser.id = UUID()
        newUser.username = username
        newUser.password = password
        save()
    }
    //func add items
    func addItems(name: String, price: Double, username: String) {
        let newItem = Item(context: context)
        
        guard let indexUsers = users.firstIndex(where: {$0.username == username}) else { return }
        
        newItem.id = UUID()
        newItem.name = name
        newItem.price = price
        newItem.users = [users[indexUsers]]
        save()
    }
    
    func deleteItem(offset: IndexSet) {
        //var items: [Item] = []
        guard let removeItem = offset.first else { return }
        let entity = items[removeItem]
        context.delete(entity)
        save()
    }
    
//    func deleteItem(id: UUID) {
//        guard let indexItem = items.firstIndex(where: { $0.id == id }) else { return }
//        
//        let item = items[indexItem]
//        context.delete(item)
//        save()
//    }
    
    func save() {
        do {
            try context.save()
            print("Saved successfully!")
            
        } catch {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}

extension CoreDataManager {
    func currentUser(username: String) throws -> User {
        guard let indexUsers = users.firstIndex(where: {$0.username == username}) else { throw URLError(.fileDoesNotExist)}
        
        return users[indexUsers]
    }
}

//extension CoreDataManager {
//    func currentItem(id: UUID) throws -> Item {
//        guard let indexItem = items.firstIndex(where: { $0.id == id }) else { throw URLError(.fileDoesNotExist)}
//
//        return items[indexItem]
//    }
//}







