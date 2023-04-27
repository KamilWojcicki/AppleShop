//
//  CartView.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

struct CartView: View {
    @StateObject private var vm = CartViewModel()
    init() { _ = Dependencies() }
    
    var body: some View {
        List {
            // MARK: Section 1
            
            Section {
                if let user = vm.user {
                    if let items = user.items?.allObjects as? [Item] {
                        ForEach(items) { item in
                            HStack {
                                VStack {
                                    Text(item.name ?? "")
                                    Text("\(item.price)")
                                }
                                
                                Spacer()
                                
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(.red)
                                    .onTapGesture {
                                        vm.delete(entity: item)
                                    }
                            }
                        }
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

