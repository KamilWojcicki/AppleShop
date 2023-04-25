//
//  DeviceInfoViewModel.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 25/04/2023.
//

import Foundation

final class DeviceInfoViewModel: ObservableObject {
    @Inject var coreData: CoreDataProtocol
   
    
    var items: [Item] = []
    init() {
        getItems()
    }
    
}

extension DeviceInfoViewModel {
    func getItems() {
        self.items = coreData.fetchItems()
    }
    
    func addItem(device: DeviceModel, username: String) {
        coreData.addItems(name: device.name, price: device.price, username: username)
    }
}
