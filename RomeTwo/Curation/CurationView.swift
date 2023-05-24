//
//  CurationView.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 5/17/23.
//

import SwiftUI

struct ImageOverlay: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("APP")
            Text("OF THE")
            Text("DAY")
        }
        .font(.custom("NotoSansTamil-ExtraBold", size: 60))
        .foregroundColor(.white)
    }
}

struct CurationImage: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("Zagreus")
                .resizable()
                .scaledToFit()
                .overlay(ImageOverlay(), alignment: .bottomLeading)
        }
    }
}

struct CurationBanner: View {
    var body: some View {
        ZStack {
            
            NavigationLink(destination: ProductView()) {
                HStack {
                    Image("HadesIcon")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Text("Hades")
                    Text("Roguelike")
                }
                .font(.custom("NotoSansTamil-Regular", size: 20))
                .foregroundColor(.white)
            }
            
            HStack {
                // TODO: Check if this spacer frame works on different sized devices
                Spacer()
                    .frame(maxWidth: 250)
                Button {
                    // TODO: Ability to buy the product
                } label: {
                    Text("GET")
                }
            }
        }
        .frame(width: .infinity)
        .background(Color(("Curation Average")))
    }
}

struct CurationDescription: View  {
    var geometry: GeometryProxy
    
    var body: some View {
        VStack(spacing: 25) {
            Spacer()
            Text("**Hades** ").foregroundColor(.white) + Text("is a god-like rogue-like dungeon crawler that combines the best aspects of Supergiant's critically acclaimed titles, including the fast-paced action of Bastion, the rich atmosphere and depth of Transistor, and the character-driven storytelling of Pyre.")
            
            Text("**BATTLE OUT OF HELL:** ").foregroundColor(.white) + Text("As the immortal Prince of the Underworld, you'll wield the powers and mythic weapons of Olympus to break free from the clutches of the god of the dead himself, while growing stronger and unraveling more of the story with each unique escape attempt.")
            
            Text("**UNLEASH THE FURY OF OLYMPUS:**").foregroundColor(.white) + Text(" The Olympians have your back! Meet Zeus, Athena, Poseidon, and many more, and choose from their dozens of powerful Boons that enhance your abilities. There are thousands of viable character builds to discover as you go.")
        }
        .font(.custom("NotoSansTamil-Regular", size: 25))
        .frame(maxWidth: geometry.size.width * 0.9)
        .foregroundColor(Color("Curation Description Text"))
        
    }
}

struct CurationView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (spacing: 0) {
                    CurationImage()
                    CurationBanner()
                    CurationDescription(geometry: geometry)
                }
            }
            .background(Color("Curation Background")).edgesIgnoringSafeArea([.all])
        }
    }
}

struct CurationView_Previews: PreviewProvider {
    static var previews: some View {
        CurationView()
    }
}
