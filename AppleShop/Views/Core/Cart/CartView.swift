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
    @Published var items: [Item] = []
    @AppStorage("username") var currentUsername: String?
    init() {
        getUsers()
        getItems()
    }
    
    func getUsers() {
        self.users = coreData.fetchUsers()
    }
    
    func getItems() {
        self.items = coreData.fetchItems()
    }
    
    func currentUser() throws-> User {
        var users: [User] = []
        
        users = coreData.fetchUsers()
        
        guard let indexUsers = users.firstIndex(where: {$0.username == currentUsername}) else{
            
            throw URLError(.fileDoesNotExist)
        }
        return users[indexUsers]
        
    }
}

struct CartView: View {
    @StateObject private var vm = CartViewModel()
    
    init() { _ = Dependencies() }
    
    var body: some View {
        VStack {
            
            Text("ITEMS")
                .font(.largeTitle)
            
//            ForEach(vm.users) { user in
//                sampleView(entity: user)
//            }
//            sampleView(entity: vm.currentUser())
            VStack {
                if let items = vm.currentUser().items?.allObjects as? [Item] {
                    Text("Items:")
                        .bold()
                    ForEach(items) { item in
                        Text(item.name ?? "")
                        Text("\(item.price)")
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

struct sampleView: View {
    let entity: User
    var body: some View {
        VStack {
            if let items = entity.items?.allObjects as? [Item] {
                Text("Items:")
                    .bold()
                ForEach(items) { item in
                    Text(item.name ?? "")
                    Text("\(item.price)")
                }
            }
        }
    }
}
