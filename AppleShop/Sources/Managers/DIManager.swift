//
//  DIManager.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import Foundation

class Dependencies {
    init() {
        @Provider var coreData = CoreDataService(coreData: CoreDataManager()) as CoreDataProtocol
        @Provider var deviceService = DeviceService() as DeviceServiceProtocol
    }
}

struct DependencyInjector {
    private static var dependencyList: [String:Any] = [:]
    
    static func resolve<T>() -> T {
        guard let t = dependencyList[String(describing: T.self)] as? T
        else { fatalError("No provider registered for type: \(T.self)") }
        
        return t
    }
    
    static func register<T>(dependency: T) {
        dependencyList[String(describing: T.self)] = dependency
    }
    
}

@propertyWrapper struct Inject<T> {
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyInjector.resolve()
    }
}

@propertyWrapper struct Provider<T> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        DependencyInjector.register(dependency: wrappedValue)
    }
}
