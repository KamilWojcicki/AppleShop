//
//  CartView.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import SwiftUI

final class CartViewModel: ObservableObject {
    @Inject var coreData: CoreDataProtocol
    
    @Published var users: [User] = []
    init() { getUsers() }
    
    func getUsers() {
        self.users = coreData.fetchUsers()
    }
}

struct CartView: View {
    @StateObject private var vm = CartViewModel()
    init() { _ = Dependencies() }
    
    var body: some View {
        VStack {
            Text("USERS")
                .font(.largeTitle)
            
            ForEach(vm.users) { user in
                sampleView(entity: user)
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
            Text(entity.username ?? "Username")
            Text(entity.password ?? "Password")
        }
    }
}

