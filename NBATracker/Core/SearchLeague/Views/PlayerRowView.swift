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
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.theme.secondaryBackgroundImage)
                )
            
            Spacer()
            
            VStack {
                Text("\(player.firstName) \(player.lastName)")
                    .font(.headline)
                    .fontWeight(.bold)
                
//                Text("")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .foregroundColor(Color.theme.secondaryText)
            }
            
            Spacer()
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerRowView(player: dev.activePlayer1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            PlayerRowView(player: dev.inactivePlayer1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            
            PlayerRowView(player: dev.activePlayer2)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
