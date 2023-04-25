//
//  Color.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

extension Color {
    
    init(red: Double, green: Double, blue: Double, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: red/255,
            green: green/255,
            blue: blue/255,
            opacity: opacity
        )
    }
    
    static var logoBackgroundColor: Color { .init(red: 108, green: 203, blue: 246) }
    
    static var buttonBackgroundColor: Color { .init(red: 173, green: 173, blue: 173) }
    
    static var textBackgroundColor: Color { .init(red: 235, green: 235, blue: 235)}
}

