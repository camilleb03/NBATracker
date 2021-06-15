//
//  SearchLeagueView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import SwiftUI

struct SearchLeagueView: View {
    
    @StateObject private var vm = SearchLeagueViewModel()
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                SearchBarView(searchText: $vm.searchText)
                
                allResultsList
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct SearchLeagueView_Previews: PreviewProvider {
    static var previews: some View {
        SearchLeagueView()
    }
}

extension SearchLeagueView {
    
    private var allResultsList: some View {
        List {
            
            ForEach(vm.allPlayers) { player in
                PlayerRowView(player: player)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
            
            ForEach(vm.allTeams) { team in
                TeamRowView(team: team)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
}
