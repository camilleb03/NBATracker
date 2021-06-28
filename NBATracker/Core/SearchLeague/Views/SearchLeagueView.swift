//
//  SearchLeagueView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import SwiftUI

struct SearchLeagueView: View {
    
    @StateObject private var vm = SearchLeagueViewModel()
    
    @State private var filterIndex = 0
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                SearchBarView(searchText: $vm.searchText)
                
                filterPicker
                
                if filterIndex == 0 {
                    
                    allPlayersList
                        .transition(AnyTransition.asymmetric(
                                        insertion: .move(edge: .leading),
                                        removal: .move(edge: .trailing)))
                } else if filterIndex == 1 {
                    allTeamsList
                        .transition(AnyTransition.asymmetric(
                                        insertion: .move(edge: .trailing),
                                        removal: .move(edge: .leading)))
                }
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
    
    private var filterPicker: some View {
        Picker("", selection: $filterIndex.animation()) {
            Text("Players").tag(0)
            Text("Teams").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
    
    private var allPlayersList: some View {
        List {
            ForEach(vm.allPlayers) { player in
                PlayerRowView(player: player)
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var allTeamsList: some View {
        List {
            ForEach(vm.allTeams) { team in
                TeamRowView(team: team)
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
}
