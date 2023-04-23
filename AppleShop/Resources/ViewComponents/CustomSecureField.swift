//
//  CustomSecureField.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import SwiftUI

struct CustomSecureField: View {
    let title: String
    let placeholder: String
    
    @State private var showPassword: Bool = false
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .bold()
                .font(.title3)
            
            HStack {
                Image(systemName: showPassword ? "lock.open" : "lock")
                    .frame(maxWidth: 25)
                    .onTapGesture { showPassword.toggle() }
                
                ZStack {
                    TextField(placeholder, text: $text)
                        .opacity(showPassword ? 1 : 0)
                    
                    SecureField(placeholder, text: $text)
                        .opacity(showPassword ? 0 : 1)
                }
                .textInputAutocapitalization(.never)
                .font(.title3)
                .padding(.top, 5)
            }
          
            
            Divider()
                .frame(maxWidth: 245)
        }
    }
}
