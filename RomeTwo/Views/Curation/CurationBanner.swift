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
            
            PurchaseButton()
            
        }
        .padding()
        .bannerModifier()
    }
}

struct CurationBanner_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([DeviceName.iPhone_8.rawValue, DeviceName.iPhone_12_mini.rawValue, DeviceName.iPhone_14_Pro_Max.rawValue], id: \.self) { device in
            CurationBanner()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
