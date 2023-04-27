//
//  MainView.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var vm = MainViewModel()
    init() { _ = Dependencies() }
    
    var body: some View {
        List {
            
            CustomSection(device: .iphone)
            
            CustomSection(device: .ipad)
            
            CustomSection(device: .macbook)
            
            CustomSection(device: .mac)
            
        }
        .environmentObject(vm)
        .customToolbar(title: "apple shop")
        .animation(.default, value: vm.searchTerm)
        .searchable(text: $vm.searchTerm, prompt: "Find a device")
        .onChange(of: vm.searchTerm) { newValue in
            vm.search(newValue)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView()
                .environmentObject(RootViewModel())
        }
    }
}


