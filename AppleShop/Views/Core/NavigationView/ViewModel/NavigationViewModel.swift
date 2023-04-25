//
//  NavigationViewModel.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import Foundation

enum SelectionState: Hashable {
    case main 
    case cart
    case kemInfo
}


final class NavigationViewModel: ObservableObject {
    
    @Published var selectionPath: [SelectionState] = []
    
    func back() {
        selectionPath.removeLast()
    }
    
    func dismiss() {
        selectionPath = []
    }
}
