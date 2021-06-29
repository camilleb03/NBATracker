//
//  PlayerImageView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import SwiftUI

struct PlayerImageView: View {
    
    @StateObject private var vm: PlayerImageViewModel
    
    init(playerID: String) {
        _vm = StateObject(wrappedValue: PlayerImageViewModel(playerID: playerID))
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
                Image(systemName: "person")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct PlayerImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerImageView(playerID: dev.activePlayer1.id)
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            PlayerImageView(playerID: dev.activePlayer2.id)
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
