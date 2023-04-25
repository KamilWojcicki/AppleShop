//
//  MainView.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var root: RootViewModel
    @StateObject private var vm = MainViewModel()
    
    init() { _ = Dependencies() }
    
    var body: some View {
        List {
            
            if vm.searchResult.contains(where: { $0.type == .iphone}) {
                iPhoneSection
            }
            
            if vm.searchResult.contains(where: { $0.type == .ipad}) {
                iPadSection
            }
            
            if vm.searchResult.contains(where: { $0.type == .macbook}) {
                macBookSection
            }
            if vm.searchResult.contains(where: { $0.type == .mac}) {
                macSection
            }
            
        }
        .navigationTitle("APPLE SHOP")
        .animation(.default, value: vm.searchTerm)
        .searchable(text: $vm.searchTerm, prompt: "Find a device")
        .textInputAutocapitalization(.never)
        .onChange(of: vm.searchTerm) { newValue in
            vm.search(newValue)
        }
        .navigationBarBackButtonHidden()
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Sign Out") { root.isLogin = false }
            }
            
            
            ToolbarItem {
                NavigationLink(value: SelectionState.kemInfo) {
                    Image(systemName: "info.circle")
                }
            }
            
            ToolbarItem {
                NavigationLink(value: SelectionState.cart) {
                    Image(systemName: "cart")
                }
            }
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

// MARK: View Components
extension MainView {
    
    private func header(title: DeviceType) -> some View {
        Text(title.rawValue)
            .font(.largeTitle)
            .textCase(.none)
            .frame(maxWidth: .infinity)
            .padding()
    }
    
    private var iPhoneSection: some View {
        Section(header: header(title: .iphone)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .iphone {
                    NavigationLink( destination:
                                        DeviceInfoExtended(dev: dev)){
                        DeviceInfo(dev: dev)
                    }
                }
            }
        }
    }
    
    private var iPadSection: some View {
        Section(header: header(title: .ipad)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .ipad {
                    NavigationLink(destination:
                                    DeviceInfoExtended(dev: dev)){
                        DeviceInfo(dev: dev)
                    }
                }
            }
        }
    }
    
    private var macBookSection: some View{
        Section(header: header(title: .macbook)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .macbook {
                    NavigationLink(destination:
                                    DeviceInfoExtended(dev: dev)){
                        DeviceInfo(dev: dev)
                    }
                }
            }
        }
    }
    
    private var macSection: some View{
        Section(header: header(title: .mac)) {
            ForEach(vm.searchResult) { dev in
                if dev.type == .mac {
                    NavigationLink(destination:
                                    DeviceInfoExtended(dev: dev)){
                        DeviceInfo(dev: dev)
                    }
                }
            }
        }
    }
    
}
