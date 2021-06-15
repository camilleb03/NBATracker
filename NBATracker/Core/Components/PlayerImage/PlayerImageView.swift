//
//  PlayerImageView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import SwiftUI

struct PlayerImageView: View {
    
    @StateObject private var vm: PlayerImageViewModel
    
    init(player: Player) {
        _vm = StateObject(wrappedValue: PlayerImageViewModel(player: player))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct PlayerImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerImageView(player: dev.activePlayer1)
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            PlayerImageView(player: dev.activePlayer2)
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
