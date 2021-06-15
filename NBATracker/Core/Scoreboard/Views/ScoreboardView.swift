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
        Text("Scoreboard")
            .onAppear(perform: {
                print(vm.allScoreboards)
            })
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardView()
    }
}
