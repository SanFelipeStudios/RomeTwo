//
//  CurationBanner.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 5/28/23.
//

import SwiftUI

extension View {
    // Curation Banner
    func appTitleStyle() -> some View {
        self
            .font(.custom("NotoSansTamil-Regular", size: 20))
            .foregroundColor(.white)
    }
    
    func appGenreStyle() -> some View {
        self
            .font(.custom("NotoSansTamil-Light", size: 10))
            .foregroundColor(.white)
    }
    
    func purchaseButtonStyle() -> some View {
        self
            .font(.custom("NotoSansTamil-ExtraBold", size: 20))
            .foregroundColor(.blue)
    }
    
    func purchaseButtonModifier() -> some View {
        self
            .frame(width: 80, height: 30)
            .background(.white)
            .clipShape(Capsule())
    }
    
    func bannerModifier() -> some View {
        self
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(Color(("Curation Average")))
    }
}

struct CurationBanner: View {
    var body: some View {
        HStack() {
            NavigationLink(destination: ProductView()) {
                HStack {
                    Image("HadesIcon")
                        .appIconModifier()
                    
                    VStack(alignment: .leading) {
                        Text("Hades")
                            .appTitleStyle()
                        Text("Roguelike")
                            .appGenreStyle()
                    }
                }
            }
            
            Spacer()
            
            // Purchase Button
            Button {
                // TODO: Ability to buy the product
            } label: {
                Text("GET")
                    .purchaseButtonStyle()
            }
            .purchaseButtonModifier()
            
        }
        .padding()
        .bannerModifier()
    }
}

struct CurationBanner_Previews: PreviewProvider {
    static var previews: some View {
        CurationBanner()
    }
}
