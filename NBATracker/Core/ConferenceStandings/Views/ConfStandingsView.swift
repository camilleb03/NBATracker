//
//  ConfStandingsView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-07-20.
//

import SwiftUI

struct ConfStandingsView: View {
    
    @StateObject private var vm = ConfStandingsViewModel()

    var body: some View {
        
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                
                columnsHeader
                    .padding(.horizontal)
                
                if !vm.allConfStandings.isEmpty {
                    ScrollView {
                        
                        ForEach(Array(vm.allConfStandings.enumerated()), id: \.offset) { index, team in
                            HStack {
                                HStack {
                                    Text("\(index + 1)")
                                    
                                    TeamImageView(teamTricode: team.teamTriCode, logoType: .secondary)
                                        .frame(width: 25, height: 25)
                                    
                                    Text(team.teamName)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Spacer()
                                
                                HStack {
                                    Text("\(team.wins)")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                                    Text("\(team.losses)")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                                    Text("\(team.gamesBehind.convertStatToString())")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                        }
                    }
                    .padding(.horizontal)
                } else {
                    
                    Text("No teams")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
            }
        }
    }
}

struct ConfStandingsView_Previews: PreviewProvider {
    static var previews: some View {
        ConfStandingsView()
    }
}

extension ConfStandingsView {
    
    private var columnsHeader: some View {
        HStack {
            HStack {
                Text("#")
                
                Text("Team")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack {
                Text("W")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("L")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("GB")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
