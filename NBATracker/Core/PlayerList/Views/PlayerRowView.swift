//
//  PlayerRowView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import SwiftUI

struct PlayerRowView: View {
    
    let player: Player
    
    var body: some View {
        HStack {
            PlayerImageView(player: player)
                .frame(width: 75, height: 75)
            Text("\(player.firstName) \(player.lastName)")
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerRowView(player: dev.activePlayer1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            PlayerRowView(player: dev.activePlayer1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
