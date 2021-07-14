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
                }
                .padding()
            }
            .navigationBarTitle(
                Text("\(vm.player.firstName) \(vm.player.lastName)"),
                displayMode: .inline
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
        VStack {
            PlayerImageView(playerID: vm.player.id)
                .frame(width: 250)
                .background(Color.theme.secondaryBackgroundImage)
                .clipShape(Circle())
                .padding(4)
            
            Text("\(vm.player.id) • \(vm.player.pos ?? " ") • #\(vm.player.jersey ?? " ")")
        }
        .padding(.bottom, 5)
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
                        HStack {
                            Text("\(info.title.capitalized) :")
                                .font(.subheadline)
                                .foregroundColor(Color.theme.secondaryText)
                            
                            Spacer()
                            
                            Text(info.value)
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                  }
        )
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
                  alignment: .leading,
                  spacing: 30,
                  pinnedViews: [],
                  content: {
                    ForEach(vm.allCareerStats) { stat in
                        VStack {
                            Text(stat.title.uppercased())
                                .font(.subheadline)
                                .foregroundColor(Color.theme.secondaryText)
                            Text(stat.value)
                                .font(.headline)
                        }
                    }
                  }
        )
    }
}
