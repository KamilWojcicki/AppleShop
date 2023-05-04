//
//  CartViewModel.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 27/04/2023.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Inject var coreData: CoreDataManager
    @Published var user: User? = nil
    @Published var totalCost: Double = 0
    
    init() {
        getUser()
        totalCostFromItems()
    }
    
    func getUser() {
        let users = coreData.fetchUser()
        user = users[0]
    }
    
    func totalCostFromItems() {
        if let user = user {
            if let items = user.items?.allObjects as? [Item] {
                for item in items {
                  totalCost += item.price
                }
            }
        }
      
    }
    
    func delete(entity: Item) {
        coreData.deleteItem(item: entity)
        getUser()
    }
}
