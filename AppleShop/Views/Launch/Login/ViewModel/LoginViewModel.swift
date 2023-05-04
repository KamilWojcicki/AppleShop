//
//  LoginViewModel.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Inject var coreData: CoreDataManager
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var showAlert: Bool = false
    @Published var message: String = ""
    
    var emptyFields: Bool {
        username.isEmpty || password.isEmpty
    }
}


//Walidacja
extension LoginViewModel {
    
    func validate() throws {
        switch true {
        case emptyFields == true:
            throw ValidationError.emptyFields
        case userExist() == false:
            throw ValidationError.invalid
        default:
            break
        }
    }
    
    func userExist() -> Bool {
        coreData.users.contains(where: { $0.username == username && $0.password == password })
    }
}

