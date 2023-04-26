//
//  CoreDataService.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import Foundation
import CoreData

protocol CoreDataProtocol {
    func fetchUsers() -> [User]
    func fetchItems() -> [Item]
    func addUser(username: String, password: String)
    func addItems(name: String, price: Double, username: String)
    func currentUser(username: String) throws -> User
    func delete(offset: IndexSet)
    func save()
    //func currentItem(id: UUID) throws -> Item
    
}

class CoreDataService: CoreDataProtocol {
    
    func delete(offset: IndexSet) {
        coreData.deleteItem(offset: offset)
    }
    
//    func currentItem(id: UUID) throws -> Item {
//        try coreData.currentItem(id: id)
//    }
    
    private let coreData: CoreDataManager
    
    init(coreData: CoreDataManager) {
        self.coreData = coreData
    }
    //fetching items
    func fetchItems() -> [Item] {
        coreData.fetchItems()
    }
    func fetchUsers() -> [User] {
        coreData.fetchUsers()
    }
    
    func addUser(username: String, password: String) {
        coreData.addUser(username: username, password: password)
    }
    //added items
    func addItems(name: String, price: Double, username: String) {
        coreData.addItems(name: name, price: price, username: username)
    }
    
    func currentUser(username: String) throws -> User {
       try coreData.currentUser(username: username)
    }
    
    func save() {
        coreData.save()
    }
    
}



class MockDataService: CoreDataProtocol {
    func delete(offset: IndexSet) {
        
    }
    
//    func currentItem(id: UUID) throws -> Item {
//        let item1 = Item(context: context)
//        item1.name = "iPhone SE"
//        item1.price = 1499.0
//
//        return item1
//    }
    
    private let context: NSManagedObjectContext = {
            let coordinator = NSPersistentStoreCoordinator(managedObjectModel: NSManagedObjectModel.mergedModel(from: [Bundle.main])!)
            let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            context.persistentStoreCoordinator = coordinator
            return context
        }()
    
    func fetchUsers() -> [User] {
        let user1 = User(context: context)
        user1.username = "login123"
        user1.password = "haslo123"
        
        return [user1]
    }
    
    func fetchItems() -> [Item] {
        let item1 = Item(context: context)
        item1.name = "iPhone XS"
        item1.price = 1499.0
        
        return [item1]
    }
    
    
    func addUser(username: String, password: String) { }
    
    func addItems(name: String, price: Double, username: String) { }
    
    func currentUser(username: String) throws -> User {
        let user1 = User(context: context)
        user1.username = "login123"
        user1.password = "haslo123"
        
        return user1
    }
    
    func save() { }
}
