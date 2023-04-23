//
//  CoreDataManager.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import Foundation
import CoreData

struct PersonalModel: Identifiable {
    let id = UUID().uuidString
    let username: String
    let password: String
}


// MARK: CoreData
class CoreDataManager {
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "AppleShopProjectApp")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
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
    
    func addUser(username: String, password: String) {
        let newUser = User(context: context)
        newUser.username = username
        newUser.password = password
        save()
    }
    
    func save() {
        do {
            try context.save()
            print("Saved successfully!")
        } catch {
            print("Erro saving Core Data. \(error.localizedDescription)")
        }
    }
}









