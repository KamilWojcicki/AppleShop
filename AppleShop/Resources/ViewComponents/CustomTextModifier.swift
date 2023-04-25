//
//  CustomTextModifier.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 25/04/2023.
//

import SwiftUI

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

extension View {
    func customTextModifier() -> some View {
        modifier(CustomTextModifier())
    }
}

