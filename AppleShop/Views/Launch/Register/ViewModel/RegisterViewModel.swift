//
//  RegisterViewModel.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    @Inject var coreData: CoreDataProtocol
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var showAlert: Bool = false 
    @Published var message: String = ""
    
    var emptyFields: Bool {
        username.isEmpty || password.isEmpty || confirmPassword.isEmpty
    }
    
    // MARK: CoreData
    var users: [User] = []
    init() { getUsers() }
    
}


// MARK: Functions
extension RegisterViewModel {
    
    func getUsers() {
        self.users = coreData.fetchUsers()
    }
    
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
        users.contains(where: { $0.username == username } )
    }
    
}
