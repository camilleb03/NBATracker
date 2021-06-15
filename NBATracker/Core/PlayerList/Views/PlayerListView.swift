//
//  PlayerListView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import SwiftUI

struct PlayerListView: View {
    
    @StateObject private var vm = PlayerListViewModel()
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                SearchBarView(searchText: $vm.searchText)
                
                allPlayersList
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}

extension PlayerListView {
    
    private var allPlayersList: some View {
        List {
            ForEach(vm.allPlayers) { player in
                PlayerRowView(player: player)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
}
