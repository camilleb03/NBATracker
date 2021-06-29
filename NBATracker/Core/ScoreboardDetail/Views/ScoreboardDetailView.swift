//
//  ScoreboardDetailView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-21.
//

import SwiftUI

struct ScoreboardDetailLoadingView: View {
    
    @Binding var scoreboard: Scoreboard?
    
    var body: some View {
        ZStack {
            if let scoreboard = scoreboard {
                ScoreboardDetailView(scoreboard: scoreboard)
            }
        }
    }
}


struct ScoreboardDetailView: View {
    
    @StateObject private var vm: ScoreboardDetailViewModel
    
    let scoreboard: Scoreboard
    
    init(scoreboard: Scoreboard) {
        _vm = StateObject(wrappedValue: ScoreboardDetailViewModel(scoreboard: scoreboard))
        self.scoreboard = scoreboard
    }
    
    var body: some View {
        ZStack {
            // background
            Color.theme.background
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 0) {
                GameInfoView(scoreboard: scoreboard)
                    .padding()
                
                GameScoreTableView(scoreboard: scoreboard)
                    .padding(.horizontal)
                
                dashboardStats
                
                Spacer()
            }
        }
        .navigationTitle(
            Text("\(scoreboard.visitorTeam.triCode) @ \(scoreboard.homeTeam.triCode)")
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                RefreshButton(isLoading: $vm.isLoading) {
                    withAnimation(.linear(duration: 2.0)) {
                        reloadBoxscoreData()
                    }
                }
            }
        })
    }
}

struct ScoreboardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabView {
                NavigationView {
                    ScoreboardDetailView(scoreboard: dev.scoreboardNotStarted)
                        .preferredColorScheme(.light)
                }
            }
            
            TabView {
                NavigationView {
                    ScoreboardDetailView(scoreboard: dev.scoreboardIsHalftime)
                        .preferredColorScheme(.light)
                }
            }
            
            TabView {
                NavigationView {
                    ScoreboardDetailView(scoreboard: dev.scoreboardIsPlaying)
                        .preferredColorScheme(.dark)
                }
            }
            
            TabView {
                NavigationView {
                    ScoreboardDetailView(scoreboard: dev.scoreboardIsFinished)
                        .preferredColorScheme(.dark)
                }
            }
        }
    }
}

extension ScoreboardDetailView {
    
    private var dashboardStats: some View {
        TabView {
            ZStack {
                Color.theme.secondaryBackground
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                
                VStack {
                    HStack {
                        TeamImageView(teamTricode: scoreboard.visitorTeam.triCode, logoType: .secondary)
                            .frame(width: 20, height: 20)
                        
                        Spacer()
                        
                        Text("Team Stats")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        TeamImageView(teamTricode: scoreboard.homeTeam.triCode, logoType: .secondary)
                            .frame(width: 20, height: 20)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    TeamTotalStatsView(allTeamGeneralStats: $vm.allTeamGeneralStats,
                                       allTeamShootingStats: $vm.allTeamShootingStats)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .padding()
            }
            .padding()
            
            ZStack {
                Color.theme.secondaryBackground
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                
                VStack {
                    HStack {
                        TeamImageView(teamTricode: scoreboard.visitorTeam.triCode, logoType: .secondary)
                            .frame(width: 20, height: 20)
                        
                        Spacer()
                        
                        Text("Team Leaders")
                            .font(.subheadline)
                        
                        Spacer()
                        
                        TeamImageView(teamTricode: scoreboard.homeTeam.triCode, logoType: .secondary)
                            .frame(width: 20, height: 20)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    TeamLeadersView(allTeamLeadersStats: $vm.allTeamLeadersStats)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .padding()
            }
            .padding()
            
            ZStack {
                Color(.systemPurple)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                Text("Play-by-play")
            }
            .padding()
            
            ZStack {
                Color(.systemIndigo)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                Text("Game Flow")
            }
            .padding()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
    
    private func reloadBoxscoreData() {
        vm.reloadData()
    }
}
