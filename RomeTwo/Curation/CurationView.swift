//
//  CurationView.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 5/17/23.
//

import SwiftUI

// ### Code Styling ###

extension Image {
    func curationImageModifier(geometry: GeometryProxy) -> some View {
        self
            .resizable()
            .scaledToFill()
            .overlay(ImageOverlay(geometry: geometry), alignment: .bottomLeading)
            .frame(maxWidth: .infinity, maxHeight: geometry.size.height * 0.6)
            .clipped()
    }
    
    func appIconModifier() -> some View {
        self
            .resizable()
            .frame(width: 48, height: 48)
            .cornerRadius(10)
    }
}

extension View {
    // Curation View
    func curationModifier() -> some View {
        self
            .background(Color("Curation Background")).edgesIgnoringSafeArea([.all])
    }
    
    // Curation Image
    func headerImageOverlayStyle() -> some View {
        self
            .font(.custom("NotoSansTamil-ExtraBold", size: 42))
            .foregroundColor(.white)
    }
    
    func headerImageModifier(geometry: GeometryProxy) -> some View {
        self
            .padding(.horizontal)
            .padding(.bottom, geometry.size.height * 0.18)
    }
    
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
            .background(.white)
            .clipShape(Capsule())
    }
    
    func bannerModifier() -> some View {
        self
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(Color(("Curation Average")))
    }
    
    // Curation Description
    func descriptionStyle() -> some View {
        self
            .font(.custom("NotoSansTamil-Regular", size: 20))
            .foregroundColor(Color("Curation Description Text"))
    }
    
    func descriptionModifier() -> some View {
        self
            .padding(.horizontal)
    }
    
}

// ### Code Logic ###

struct ImageOverlay: View {
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading, spacing: -15) {
            Text("APP")
            Text("OF THE")
            Text("DAY")
        }
        .headerImageModifier(geometry: geometry)
        .headerImageOverlayStyle()
    }
}

struct CurationImage: View {
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(spacing: 0) {
            Image("Zagreus")
                .curationImageModifier(geometry: geometry)
        }
    }
}

struct CurationBanner: View {
    var geometry: GeometryProxy
    
    var body: some View {
        HStack() {
            Spacer()
            
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
            
            ForEach (0..<10) { i in
                Spacer()
            }
            
            // Purchase Button
            Button {
                // TODO: Ability to buy the product
            } label: {
                Text("GET")
                    .purchaseButtonStyle()
            }
            .purchaseButtonModifier()
            
            Spacer()
        }
        .bannerModifier()
    }
}

struct CurationDescription: View  {
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            Text("**Hades** ").foregroundColor(.white) + Text("is a god-like rogue-like dungeon crawler that combines the best aspects of Supergiant's critically acclaimed titles, including the fast-paced action of Bastion, the rich atmosphere and depth of Transistor, and the character-driven storytelling of Pyre.")
            
            Text("**BATTLE OUT OF HELL:** ").foregroundColor(.white) + Text("As the immortal Prince of the Underworld, you'll wield the powers and mythic weapons of Olympus to break free from the clutches of the god of the dead himself, while growing stronger and unraveling more of the story with each unique escape attempt.")
            
            Text("**UNLEASH THE FURY OF OLYMPUS:**").foregroundColor(.white) + Text(" The Olympians have your back! Meet Zeus, Athena, Poseidon, and many more, and choose from their dozens of powerful Boons that enhance your abilities. There are thousands of viable character builds to discover as you go.")
        }
        .descriptionStyle()
        .descriptionModifier()
        
    }
}

struct CurationView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (spacing: 0) {
                    CurationImage(geometry: geometry)
                    CurationBanner(geometry: geometry)
                    CurationDescription()
                }
            }
            .curationModifier()
        }
    }
}

struct CurationView_Previews: PreviewProvider {
    static var previews: some View {
        CurationView()
    }
}
