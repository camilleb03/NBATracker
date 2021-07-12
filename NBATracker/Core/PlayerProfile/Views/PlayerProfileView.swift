//
//  PlayerProfileView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-07-09.
//

import SwiftUI

struct PlayerProfileView: View {
    
    @StateObject private var vm: PlayerProfileViewModel
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init(player: Player) {
        _vm = StateObject(wrappedValue: PlayerProfileViewModel(player: player, playerDetailsDataService: PlayerDetailDataService(playerID: player.id)))
    }
    
    var body: some View {
        ZStack {
            // background
            Color.theme.background
                .ignoresSafeArea()
            
            // content
            ScrollView {
                VStack {
                    playerHeader
                    playerBioTitle
                    Divider()
                    playerBioList
                    careerStatsSummaryTitle
                    Divider()
                    careerStatsSummaryGrid
                    Spacer()
                }
                .padding()
            }
            .navigationTitle(
                Text("\(vm.player.firstName) \(vm.player.lastName)")
            )
        }
    }
}

struct PlayerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                PlayerProfileView(player: dev.activePlayer1)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Players")
            }
            .preferredColorScheme(.light)
            
            NavigationView {
                PlayerProfileView(player: dev.inactivePlayer1)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Players")
            }
            .preferredColorScheme(.dark)
        }
    }
}

extension PlayerProfileView {
    
    private var playerHeader: some View {
        PlayerImageView(playerID: vm.player.id)
            .frame(width: 250, height: 250)
            .padding(4)
    }
    
    private var playerBioTitle: some View {
        Text("information".capitalized)
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var playerBioList: some View {
        LazyVGrid(columns: [GridItem()],
                  alignment: .leading,
                  spacing: 10,
                  content: {
                    ForEach(vm.allPlayerBio) { info in
                        Text("\(info.title.capitalized): \(info.value)")
                    }
                  })
    }
    
    private var careerStatsSummaryTitle: some View {
        Text("career summary".capitalized)
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var careerStatsSummaryGrid: some View {
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: 30,
                  pinnedViews: [],
                  content: {
                    ForEach(vm.allCareerStats) { stat in
                        VStack {
                            Text(stat.title.uppercased())
                            
                            Text(stat.value)
                        }
                    }
                  })
    }
}
