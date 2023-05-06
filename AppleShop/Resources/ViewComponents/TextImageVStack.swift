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
    @State private var isLongPressing = false
    @State private var imageScale: CGFloat = 1.0
    var body: some View {
        VStack {
            Text(name)
                .font(.caption.bold())
            
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .scaleEffect(imageScale)
                .gesture(
                    LongPressGesture(minimumDuration: 1.0)
                        .onChanged { value in
                            withAnimation {
                                isLongPressing = true
                                imageScale = 1.5
                            }
                        }
                        .onEnded { value in
                            withAnimation {
                                isLongPressing = false
                                imageScale = 1.0
                            }
                        }
                )
        }
    }
}
