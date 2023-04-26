//
//  CartView.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

final class CartViewModel: ObservableObject {
    @Inject var coreData: CoreDataProtocol
    
    @Published var users: [User] = []
    //@Published var items: [Item] = []
    @AppStorage("username") var currentUsername: String?
    init() {
        getUsers()
       // getItems()
    }
    
    func getUsers() {
        self.users = coreData.fetchUsers()
    }
    
//    func getItems() {
//        self.items = coreData.fetchItems()
//    }
    
    func delete(index: IndexSet) {
        coreData.delete(offset: index)
    }
    
//    func currentItem() -> Item {
//        var items: [Item] = []
//
//        items = coreData.fetchItems()
//
//        guard let indexItems = items.firstIndex(where: { $0.id == })
//    }
    
    
    func currentUser() -> User {
        var users: [User] = []
        
        users = coreData.fetchUsers()
        
        guard let indexUsers = users.firstIndex(where: {$0.username == currentUsername}) else{ fatalError() }
        return users[indexUsers]
        
    }
}

struct CartView: View {
    @StateObject private var vm = CartViewModel()
    
    init() { _ = Dependencies() }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    if let items = vm.currentUser().items?.allObjects as? [Item] {
                        ForEach(items) { item in
                            VStack {
                                Text(item.name ?? "")
                                Text("\(item.price)")
                            }
                        }
                        .onDelete(perform: vm.delete)
                    }
                }
            }
        }
    }
}
    


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

