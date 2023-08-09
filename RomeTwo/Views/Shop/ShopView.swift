//
//  ShopView.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 8/8/23.
//

import SwiftUI

extension View {
    func shopModifier() -> some View {
        self
            .background(Color("Shop Background"))
    }
    
    func embeddedNav() -> some View {
        NavigationView {
            self
        }
    }
}

struct ShopView: View {
    
    @State var games = [Game]()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (spacing: 0) {
                    ForEach(games, id: \.id) { game in
                        CommonBanner(color: "Curation Background", game: game)
                    }
                }
            }
            .shopModifier()
            .embeddedNav()
        }
        .navigationBarTitle("Games", displayMode: .large)
        .onAppear {
            seedGames()
        }
    }
    
    func seedGames() {
        games.append(Game.gameOne)
        games.append(Game.gameTwo)
        games.append(Game.gameThree)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([DeviceName.iPhone_8.rawValue, DeviceName.iPhone_12_mini.rawValue, DeviceName.iPhone_14_Pro_Max.rawValue], id: \.self) { device in
            ShopView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}

