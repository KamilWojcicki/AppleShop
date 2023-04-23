//
//  LaunchAppView.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import SwiftUI

struct LaunchAppView: View {
    @State private var showLogin = true
    
    var body: some View {
        ZStack {
            if showLogin {
                LoginView()
                    .transition(.push(from: .leading))
            } else {
                RegisterView()
                    .transition(.push(from: .leading))
            }
            
            button
        }
        .background {
            Image("appleLogo")
                .renderingMode(.template)
                .resizable()
                .scaledToFill()
                .scaleEffect(1.3)
                .offset(x: -150, y: -50)
                .opacity(0.6)
                .shadow(color: Color.black, radius: 10, x: 0.0, y: 12.0)
        }
    }
}

struct LaunchAppView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchAppView()
    }
}


// MARK: View Components
extension LaunchAppView {
    
    private var button: some View {
        HStack {
            Text(showLogin ? "Don't have an account?" : "Already have an account?")
            
            Button {
                withAnimation() { showLogin.toggle() }
            } label: {
                Text(showLogin ? "Register now" : "Log in")
                    .bold()
                    .foregroundColor(Color.blue)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .padding(.bottom)
    }
}
