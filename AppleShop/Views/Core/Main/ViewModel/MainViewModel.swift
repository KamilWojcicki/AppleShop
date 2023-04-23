//
//  MainViewModel.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import Foundation


class MainViewModel: ObservableObject {
    @Inject var devices: DeviceServiceProtocol
    private(set) var data: [DeviceModel] = []
    
    @Published var searchResult: [DeviceModel] = []
    @Published var searchTerm: String = ""
    
    init() {
        self.data = devices.fetchDevice()
        search()
    }
    
    func search(_ value: String = "") {
        let fileteredData = data.filter { $0.name.lowercased().contains(value.lowercased()) }
        
        self.searchResult = searchTerm.isEmpty ? data : fileteredData
    }
}
