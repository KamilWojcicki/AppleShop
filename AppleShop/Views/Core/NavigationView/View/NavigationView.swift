//
//  NavigationView.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

//atrybut State object działa jak @State tylko dostępne jest dla wielu widoków.

//environment object używa się do przesyłania danych pomiędzy widokami(hierarchia widoków) nie musimy ręcznie przekazywać danych do każdego widoku. Aby to zadziałało potrzebny jest ObservableObject czyli obiekt który inne widoki będą obserwować.

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
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
