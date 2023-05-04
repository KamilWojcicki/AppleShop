//
//  ViewModifier.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 27/04/2023.
//

import SwiftUI

extension View {
    func customTextModifier() -> some View {
        modifier(CustomTextModifier())
    }
    
   
    func customToolbar(title: String) -> some View {
        modifier(CustomToolbarViewModifier(title: title))
    }
}


struct CustomTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.headline)
            .background(Color.textBackgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10, x: 10, y: 10)
            .padding(.bottom, 20)
    }
}

struct CustomToolbarViewModifier: ViewModifier {
    @EnvironmentObject var root: RootViewModel
    let title: String
    func body(content: Content) -> some View {
        content
            .navigationTitle(title.uppercased())
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


