//
//  CartViewModel.swift
//  AppleShop
//
//  Created by MaToSens on 27/04/2023.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Inject var coreData: CoreDataManager
    @Published var user: User? = nil
    
    init() { getUser() }
    
    func getUser() {
        let users = coreData.fetchUser()
        user = users[0]
    }
    
    func delete(entity: Item) {
        coreData.deleteItem(item: entity)
        getUser()
    }
}
