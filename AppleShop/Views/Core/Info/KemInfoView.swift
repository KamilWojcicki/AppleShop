//
//  KemInfoView.swift
//  AppleShop
//
//  Created by Kamil Wójcicki on 23/04/2023.
//

import SwiftUI

struct KemInfoView: View {
    var body: some View {
        ScrollView {
            VStack{
                    Image("logoKEM")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200, alignment: .top)
                        
                VStack{
                    
                    Text("KEM CONCERN is a company dedicated to developing iOS software in Swift and also with Swift UI.")
                        .customTextModifier()

                    Text("A team of experienced programmers offers comprehensive services, including consultations, design, implementation and technical support.")
                        .customTextModifier()
                        
                    Text("The company focuses on innovation, quality and customer satisfaction.")
                        .customTextModifier()
                    Text("Its software is the perfect solution for anyone looking for the best and latest solutions in the industry.")
                        .customTextModifier()
                    Spacer()
                    
                    Text("Authors:")
                        .font(.title3)
                        .padding()
                    
                    HStack(spacing: 20){
                        
                          TextImageVStack(image: "kamil", name: "Kamil Wójcicki")
                        TextImageVStack(image: "eryk", name: "Eryk Urban")
                        TextImageVStack(image: "mateusz", name: "Mateusz Zdunek")
                    }
                }
                .padding()
            }
        }
    }
}

struct KemInfoView_Previews: PreviewProvider {
    static var previews: some View {
        KemInfoView()
    }
}



