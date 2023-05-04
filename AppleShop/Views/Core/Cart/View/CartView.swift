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
        VStack {
            List {
                
                Section {
                    if let user = vm.user {
                        if let items = user.items?.allObjects as? [Item] {
                            
                            if items.isEmpty {
                                Text("EMPTY CART")
                            } else {
                                ForEach(items) { item in
                                    
                                    HStack {
                                            
                                        Text(item.name ?? "")
                                            .frame(maxWidth: 130, alignment: .leading)
                                        Spacer()
                                        
                                        Text("\(item.price, specifier: "%.2f") zł")
                                            
                                        Spacer()
                                        
                                        
                                        
                                        Image(systemName: "xmark.circle")
                                            .foregroundColor(.red)
                                            .onTapGesture {
                                                vm.totalCost -= item.price
                                                vm.delete(entity: item)
                                                }
                                        }
                                }
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("Items:")
            Text("Total cost: \(vm.totalCost, specifier: "%.2f") zł")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
        }
    }
}



struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

