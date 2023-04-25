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
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    var users: [User] = []
    
    init() {
        container = NSPersistentContainer(name: "AppleShopProjectApp")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
        
        self.users = fetchUsers()
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






