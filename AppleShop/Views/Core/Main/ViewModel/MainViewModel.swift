//
//  MainViewModel.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import Foundation
//wstrzykiwanie danych DeviceModel
//private(set) oznacza dane tylko do odczytu na zewnątrz, nie ma możliwości ich modyfikacji
//funkcja filtrująca data, szuka nazwy która zawiera wartość wpisaną przez użytkownika, poprzez ternary operator sprawdzamy czy fraza została wpisana, jeśli nie wyświetlamy data(wszystkie urządzenia), w przeciwnym wypadku przefiltrowane urządzenia.

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
