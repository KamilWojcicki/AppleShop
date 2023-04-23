//
//  CustomTextField.swift
//  AppleShop
//
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .bold()
                .font(.title3)
            HStack {
                Image(systemName: "person")
                    .frame(maxWidth: 25)

                TextField(placeholder, text: $text)
                    .textInputAutocapitalization(.never)
                    .font(.title3)
                    .padding(.top, 5)
            }
          
            
            Divider()
                .frame(maxWidth: 245)
        }
    }
}


