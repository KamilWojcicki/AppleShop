//
//  CustomSection.swift
//  AppleShop
//
//  Created by MaToSens on 27/04/2023.
//

import SwiftUI

struct CustomSection: View {
    @EnvironmentObject var vm: MainViewModel
    let device: DeviceType
    
    var body: some View {
        if vm.searchResult.contains(where: { $0.type == device }) {
            Section(header: header(title: device)) {
                ForEach(vm.searchResult) { dev in
                    if dev.type == device {
                        NavigationLink( destination: DeviceInfoExtended(dev: dev)){
                            DeviceInfo(dev: dev)
                        }
                    }
                }
            }
        }
    }
    
    private func header(title: DeviceType) -> some View {
        Text(title.rawValue)
            .font(.largeTitle)
            .textCase(.none)
            .frame(maxWidth: .infinity)
            .padding()
    }
}
