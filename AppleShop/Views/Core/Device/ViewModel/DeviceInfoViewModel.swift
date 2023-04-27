//
//  DeviceInfoViewModel.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 25/04/2023.
//

import Foundation

final class DeviceInfoExtendedViewModel: ObservableObject {
    @Inject var coreData: CoreDataManager
    
    func addItem(device: DeviceModel) {
        coreData.addItem(device: device)
    }
}
