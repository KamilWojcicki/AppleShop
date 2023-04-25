//
//  TextImageVStack.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 25/04/2023.
//

import SwiftUI

struct TextImageVStack: View {
    let image: String
    let name: String
    var body: some View {
        VStack {
            Text(name)
                .font(.caption.bold())
            
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}
