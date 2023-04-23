//
//  DeviceInfoExtended.swift
//  AppleShop
//
//  Created by Michał Jabłoński on 23/04/2023.
//

import SwiftUI

struct DeviceInfoExtended: View {
    let dev: DeviceModel
    
    var body: some View {
        VStack{
            
            Spacer()
            
            HStack{
                Image(dev.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 150, maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(width: 310, height: 300)
            .background(Color("backgroundColor"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.bottom, 10)
            HStack{
                HStack{
                    
                    Text("Model:\n\(dev.name)")
                        .padding()
                }
                .frame(width: 150, height: 100, alignment: .leading)
                .background()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                HStack{
                    Text("Price: \n\(dev.price, specifier: "%.2f") zł")
                        .padding()
                }
                .frame(width: 150, height: 100, alignment: .leading)
                .background(Color("backgroundColor"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Button(action: {
                //vm.addItemToChart(name: dev.name, price: dev.price)
            }, label: {
                Text("Add to CART")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.buttonBackgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 10)
                    .padding(.top, 30)
            })
            
            Spacer()
            Text("Designed by KEM")
            Text("Kamil-Eryk-Mateusz")
                .font(.caption2)
            VStack{
                
            }
        }
    }
}

struct DeviceInfoExtended_Previews: PreviewProvider {
    static var previews: some View {
        DeviceInfoExtended(dev: .sample)
    }
}
