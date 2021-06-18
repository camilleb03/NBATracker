//
//  ScoreboardView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-15.
//

import SwiftUI

struct ScoreboardView: View {
    
    @StateObject private var vm = ScoreboardViewModel()
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                header
                
                if !vm.allScoreboards.isEmpty {
                    scoreboardsList
                } else {
                    Text("No results found")
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScoreboardView()
                .previewDevice("iPhone 8")
                .preferredColorScheme(.light)
            
            ScoreboardView()
                .preferredColorScheme(.dark)
        }
    }
}

extension ScoreboardView {
    
    var header: some View {
        HStack {
            Text("Games")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            
            DatePicker("", selection: $vm.gameDate, displayedComponents: .date)
            
            Spacer()
            
            refreshButton
        }
        .padding()
    }
    
    private var refreshButton: some View {
        Button(action: {
            withAnimation(.linear(duration: 2.0)) {
                vm.reloadData(for: vm.gameDate)
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
            }
        }
    }
}
