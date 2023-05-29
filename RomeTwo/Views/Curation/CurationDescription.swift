//
//  CurationDescription.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 5/28/23.
//

import SwiftUI

extension View {
    func descriptionStyle() -> some View {
        self
            .font(.custom("NotoSansTamil-Regular", size: 20))
            .foregroundColor(Color("Curation Description Text"))
    }
    
    func descriptionModifier() -> some View {
        self
            .padding(.horizontal)
            .background(Color("Curation Background")).edgesIgnoringSafeArea([.all])
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

struct CurationDescription_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            CurationDescription()
                .edgesIgnoringSafeArea([.all])
        }
    }
}
