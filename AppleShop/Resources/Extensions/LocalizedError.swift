//
//  LocalizedError.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import Foundation

enum ValidationError: LocalizedError {
    case invalid
    case invalidUsername
    case invalidPassword
    case notMatch
    case emptyFields
    
    
    var errorDescription: String? {
        switch self {
        case .invalid:
            return "Username or password is incorrect "
        case .invalidUsername:
            return "Username already exist"
        case .invalidPassword:
            return "Password too short"
        case .notMatch:
            return "Passwords do not match."
        case .emptyFields:
            return "One or more fields are empty"
        }
    }
}
