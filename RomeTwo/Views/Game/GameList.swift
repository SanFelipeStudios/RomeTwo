//
//  GameList.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 8/15/23.
//

import SwiftUI

struct GameList: View {
    var body: some View {
        List(games, id: \.id) { game in
            GameRow(game: game)
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList()
    }
}
