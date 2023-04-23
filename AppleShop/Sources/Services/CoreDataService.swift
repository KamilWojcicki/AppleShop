//
//  CoreDataService.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import Foundation
import CoreData

protocol CoreDataProtocol {
    func fetchUsers() -> [User]
    func addUser(username: String, password: String)
    func save()
}

class CoreDataService: CoreDataProtocol {
    private let coreData: CoreDataManager
    
    init(coreData: CoreDataManager) {
        self.coreData = coreData
    }
    
    func fetchUsers() -> [User] {
        coreData.fetchUsers()
    }
    
    func addUser(username: String, password: String) {
        coreData.addUser(username: username, password: password)
    }
    
    func save() {
        coreData.save()
    }
    
}



class MockDataService: CoreDataProtocol {
    
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
    
    
    func addUser(username: String, password: String) { }
    
    func save() { }
}
