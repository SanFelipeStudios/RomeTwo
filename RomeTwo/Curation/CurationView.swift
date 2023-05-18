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

struct CurationView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image("Zagreus")
                    .resizable()
                    .scaledToFit()
                    .overlay(ImageOverlay(), alignment: .bottomLeading)
                ZStack {
                    NavigationLink {
                        LoginView()
                    } label: {
                        Label("Work Folder", systemImage: "folder")
                    }
                    HStack {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("GET")
                        }
                    }
                }
                VStack(spacing: 25) {
                    Spacer()
                    Text("Hades is a god-like rogue-like dungeon crawler that combines the best aspects of Supergiant's critically acclaimed titles, including the fast-paced action of Bastion, the rich atmosphere and depth of Transistor, and the character-driven storytelling of Pyre.")
                    
                    Text("BATTLE OUT OF HELL As the immortal Prince of the Underworld, you'll wield the powers and mythic weapons of Olympus to break free from the clutches of the god of the dead himself, while growing stronger and unraveling more of the story with each unique escape attempt.")
                    
                    Text("UNLEASH THE FURY OF OLYMPUS The Olympians have your back! Meet Zeus, Athena, Poseidon, and many more, and choose from their dozens of powerful Boons that enhance your abilities. There are thousands of viable character builds to discover as you go.")
                }
                .font(.custom("NotoSansTamil-Regular", size: 25))
                .frame(maxWidth: .infinity)
                .background(Color("Curation Background"))
                .foregroundColor(Color("Curation Description Text"))
            }
        }
        .ignoresSafeArea()
    }
}

struct CurationView_Previews: PreviewProvider {
    static var previews: some View {
        CurationView()
    }
}
