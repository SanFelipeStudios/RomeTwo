//
//  GameView.swift
//  RomeTwo
//
//  Created by Nicholas Rillera on 8/15/23.
//

import SwiftUI

struct GameRow: View {
    var game: Game
    
    var body: some View {
        VStack {
            // Get Media by Id
            Text(game.title)
        }
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameRow(game: games[0])
            GameRow(game: games[1])
        }
    }
}
