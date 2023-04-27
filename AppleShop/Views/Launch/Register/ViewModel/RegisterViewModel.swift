//
//  RegisterViewModel.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Inject var coreData: CoreDataManager
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var showAlert: Bool = false 
    @Published var message: String = ""
    
    var emptyFields: Bool {
        username.isEmpty || password.isEmpty || confirmPassword.isEmpty
    }
}


// MARK: Functions
extension RegisterViewModel {
    
    func signUp() throws {
        try validate()
        coreData.addUser(username: username, password: password)
        cleanFields()
    }
    
    func cleanFields() {
        username = ""
        password = ""
        confirmPassword = ""
    }
}


// MARK: Validation
extension RegisterViewModel {
    
    func validate() throws {
        switch true {
        case userExist() == true:
            throw ValidationError.invalidUsername
        case password.count < 3:
            throw ValidationError.invalidPassword
        case emptyFields == true:
            throw ValidationError.emptyFields
        case password != confirmPassword:
            throw ValidationError.notMatch
        default:
            break
        }
        
    }
    
    func userExist() -> Bool {
        coreData.users.contains(where: { $0.username == username } )
    }
    
}
