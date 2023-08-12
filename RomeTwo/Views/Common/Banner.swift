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
    
    func bannerModifier(color: String) -> some View {
        self
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(Color(color))
    }
}

struct CommonBanner: View {

    var color: String
    var game: Game
    
    var body: some View {
        HStack() {
            NavigationLink(destination: CurationView()) {
                HStack {
                    Image("HadesIcon")
                        .appIconModifier()
                    
                    VStack(alignment: .leading) {
                        Text(game.title)
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
        .bannerModifier(color: color)
    }
}

struct CommonBanner_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([DeviceName.iPhone_8.rawValue, DeviceName.iPhone_12_mini.rawValue, DeviceName.iPhone_14_Pro_Max.rawValue], id: \.self) { device in
            CommonBanner(color: "Curation Background", game: Game.gameOne)
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
