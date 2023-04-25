//
//  DeviceInfoExtended.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

struct DeviceInfoExtended: View {
    
    let dev: DeviceModel
    @StateObject var vm = DeviceInfoViewModel()
    @AppStorage("username") var currentUsername: String?
    
    var body: some View {
        VStack{
            
            Spacer()
            
            
            Image(dev.image)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 10)
            
            HStack(spacing: 20){

                Text("Model:\n\(dev.name)")
                Spacer()
                Text("Price: \n\(dev.price, specifier: "%.2f") zł")
                    
            }
            .frame(maxWidth: .infinity)
            .padding()
            .padding(.horizontal)
            .background(Color.textBackgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Button(action: {
                if let username = currentUsername {
                    vm.addItem(device: dev, username: username)
                }
                
            }, label: {
                Text("Add to CART")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.buttonBackgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.top, 30)
            })
            
            Spacer()
            Text("Designed by KEM")
            Text("Kamil-Eryk-Mateusz")
                .font(.caption2)
        }
        .padding(.horizontal)
    }
}

struct DeviceInfoExtended_Previews: PreviewProvider {
    static var previews: some View {
        DeviceInfoExtended(dev: .sample)
    }
}
