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
    
    let username = UserDefaults.standard.string(forKey: "username")
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
        
        fetchUsers()
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


// MARK: Users functions
extension CoreDataManager {
    
    @discardableResult
    func fetchUsers() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            users = try context.fetch(request)
            return users
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func fetchUser() -> [User] {
        guard let username = username else { fatalError() }
        
        let request = NSFetchRequest<User>(entityName: "User")
        let filter = NSPredicate(format: "username == %@", username)
        request.predicate = filter
        
        do {
            users = try context.fetch(request)
            return users
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
    
}

// MARK: Items functions
extension CoreDataManager {
    
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
    
    func addItem(device: DeviceModel) {
        users = fetchUsers()
        
        let newItem = Item(context: context)
        guard let indexUsers = users.firstIndex(where: {$0.username == username})
        else { return }
        
        newItem.id = UUID()
        newItem.name = device.name
        newItem.price = device.price
        newItem.addToUsers(users[indexUsers])
        save()
    }
    
    func deleteItem(item entity: Item) {
        context.delete(entity)
        save()
    }
}










