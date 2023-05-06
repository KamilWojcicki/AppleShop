//
//  RegisterView.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var vm = RegisterViewModel()
    init() { _ = Dependencies() }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            header
            
            textFields
        
            button
        }
        .padding()
        .alert(vm.message, isPresented: $vm.showAlert) { }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView {
    
    private var header: some View {
        Text("Register now")
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
            
            CustomSecureField(title: "Confirm Password",
                              placeholder: "enter your password again",
                              text: $vm.confirmPassword)
        }
    }
    
    private var button: some View {
        Button {
            do {
                try vm.signUp()
                vm.showAlert.toggle()
                vm.message = "User added successfully"
            } catch {
                vm.showAlert.toggle()
                vm.message = error.localizedDescription
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


