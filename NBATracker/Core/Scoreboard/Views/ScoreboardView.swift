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
    @State private var showGameDatePicker: Bool = false
    
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
                    
                    Text("No games found")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $showGameDatePicker,
                   content: {
                    CustomDatePicker(gameDate: $vm.gameDate)
                   })
        }
        .navigationTitle(vm.gameDate.convertDateToLocalDateMediumString())
        .toolbar(content: {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    showGameDatePicker.toggle()
                }, label: {
                    Image(systemName: "calendar")
                })
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
