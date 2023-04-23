//
//  NavigationView.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import SwiftUI

struct NavigationView: View {
    @StateObject private var vm = NavigationViewModel()
    
    var body: some View {
        NavigationStack(path: $vm.selectionPath) {
            
            MainView()
            
                .navigationDestination(for: SelectionState.self) { state in
                    switch state {
                    case .main:     MainView()
                    case .cart:     CartView()
                    case .kemInfo:  KemInfoView()
                    }
                }
            
        }
        .environmentObject(vm)
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
