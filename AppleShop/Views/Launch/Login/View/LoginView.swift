//
//  LoginView.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var root: RootViewModel
    @StateObject private var vm = LoginViewModel()
    init() { _ = Dependencies() }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            header
            
            textFields
            
            button
        }
        .alert(vm.message, isPresented: $vm.showAlert) { }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(RootViewModel())
    }
}


// MARK: View Components
extension LoginView {
    
    private var header: some View {
        Text("Sign in")
            .font(.largeTitle.bold())
            .kerning(1.8)
            .padding(.bottom, 5)
    }
    
    private var textFields: some View {
        VStack(spacing: 20) {
            CustomTextField(title: "Username",
                            placeholder: "enter your username",
                            text: $vm.username)
            
            
            CustomSecureField(title: "Password",
                              placeholder: "enter your password",
                              text: $vm.password)
        }
    }
    
    private var button: some View {
        Button {
            do {
                try vm.validate()
                root.isLogin = true
            } catch {
                vm.message = error.localizedDescription
                vm.showAlert.toggle()
            }
        } label: {
            Image(systemName: "arrow.right")
                .font(.title2.bold())
                .foregroundColor(.white)
                .padding()
                .background(
                    Circle()
                        .fill(Color.buttonBackgroundColor)
                        .shadow(color: .black.opacity(0.6), radius: 5, x: 0, y: 0)
                )
        }
    }
    
}



