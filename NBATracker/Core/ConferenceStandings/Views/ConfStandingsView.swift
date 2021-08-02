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
            NavigationView {
                VStack {
                    
                    filterPicker
                    
                    columnsHeader
                        .padding(.horizontal)
                    
                    if !vm.allConfStandings.isEmpty {
                        ScrollView {
                            
                            ForEach(Array(vm.allConfStandings.enumerated()), id: \.1.id) { index, team in
                                ConfStandingsRowView(position: index+1, team: team)
                            }
                        }
                        .padding(.horizontal)
                    } else {
                        
                        Text("No teams")
                            .font(.callout)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }
                }
                .navigationTitle("Standings")
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
    
    private var filterPicker: some View {
        Picker("", selection: $vm.filterOption.animation()) {
            Text("East").tag(Conference.east)
            Text("West").tag(Conference.west)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
    
    private var columnsHeader: some View {
        HStack {
            HStack {
                Text("#")
                
                Text("Team")
            }
            .font(.subheadline)
            .frame(maxWidth: .infinity, alignment: .leading)
            
//            Spacer()
            
            HStack {
                Text("W")
                    .frame(maxWidth: .infinity)
                
                Text("L")
                    .frame(maxWidth: .infinity)
                
                Text("PCT")
                    .frame(maxWidth: .infinity)
                
                Text("GB")
                    .frame(maxWidth: .infinity)
            }
            .font(.caption)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
