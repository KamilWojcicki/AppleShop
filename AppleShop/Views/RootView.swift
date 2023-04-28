//
//  RootView.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var vm = RootViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLogin { NavigationView() }
            else { LaunchAppView() }
        }
        .environmentObject(vm)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}



class RootViewModel: ObservableObject {
    @Published var isLogin: Bool = false
}
