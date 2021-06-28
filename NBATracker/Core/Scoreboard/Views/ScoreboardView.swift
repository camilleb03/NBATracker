//
//  ScoreboardView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-15.
//

import SwiftUI

struct ScoreboardView: View {
    
    @StateObject private var vm = ScoreboardViewModel()
    
    @State private var selectedScoreboard: Scoreboard? = nil
    @State private var showScoreboardDetailView: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                
                if !vm.allScoreboards.isEmpty {
                    scoreboardsList
                } else {
                    Spacer()
                    
                    Text("No games found for \n \(vm.gameDate.convertDateToLocalDateMediumString())")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                
                Spacer(minLength: 0)
            }
        }
        .navigationTitle("Games")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            
            ToolbarItem(placement: .navigationBarLeading) {
                gameDatePicker
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                RefreshButton(isLoading: $vm.isLoading) {
                    withAnimation(.linear(duration: 2.0)) {
                        refreshScoreboardData()
                    }
                }
            }
        })
        .onAppear() {
            print("Scoreboards appeared !")
            refreshScoreboardData()
        }
        .background(
            NavigationLink(
                destination: ScoreboardDetailLoadingView(scoreboard: $selectedScoreboard),
                isActive: $showScoreboardDetailView,
                label: {
                    EmptyView()
                })
        )
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ScoreboardView()
            }
            .preferredColorScheme(.light)
            
            NavigationView {
                ScoreboardView()
            }
            .preferredColorScheme(.dark)
        }
    }
}

extension ScoreboardView {
    
    private var gameDatePicker: some View {
        DatePicker("", selection: $vm.gameDate, displayedComponents: .date)
    }
    
    private func refreshScoreboardData() {
        vm.reloadData(for: vm.gameDate)
    }
    
    private var refreshButton: some View {
        Button(action: {
            withAnimation(.linear(duration: 2.0)) {
                refreshScoreboardData()
            }
        }, label: {
            Image(systemName: "goforward")
        })
        .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
    }
    
    private var scoreboardsList: some View {
        ScrollView {
            ForEach(vm.allScoreboards) { scoreboard in
                ScoreboardRowView(scoreboard: scoreboard)
                    .onTapGesture {
                        segue(scoreboard: scoreboard)
                    }
            }
        }
    }
    
    private func segue(scoreboard: Scoreboard) {
        selectedScoreboard = scoreboard
        showScoreboardDetailView.toggle()
    }
}
