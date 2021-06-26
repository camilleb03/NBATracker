//
//  GameColumnView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-25.
//

import SwiftUI

struct GameColumnView: View {
    
    let columnTitle: String
    let homeRow: String
    let visitorRow: String
    let isCurrentPeriod: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Group {
                Text(columnTitle)
                    .fontWeight(isCurrentPeriod ? .semibold : .thin)
                    .padding(5)
                    .background(Color.theme.secondaryBackground)
                    .lineLimit(1)
                
                Text(homeRow.isEmpty ? "-" : homeRow)
                    .fontWeight(isCurrentPeriod ? .bold : nil)
                
                Text(visitorRow.isEmpty ? "-" : visitorRow)
                    .fontWeight(isCurrentPeriod ? .bold : nil)
                    .padding(.bottom, 5)
            }
        }
    }
}

struct GameColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack(spacing: 0) {
                GameColumnView(columnTitle: "Team", homeRow: "UTA", visitorRow: "TOR", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "Q1", homeRow: "17", visitorRow: "25", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "Q2", homeRow: "43", visitorRow: "25", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "Q3", homeRow: "0", visitorRow: "6", isCurrentPeriod: true)
                
                GameColumnView(columnTitle: "Q4", homeRow: "-", visitorRow: "-", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "Score", homeRow: "60", visitorRow: "56", isCurrentPeriod: false)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .background(
                RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder(Color.theme.secondaryBackground, lineWidth: 2)
            )
            .padding()
        }
        .preferredColorScheme(.light)
        .previewLayout(.sizeThatFits)
        
        Group {
            HStack(spacing: 0) {
                GameColumnView(columnTitle: "Team", homeRow: "UTA", visitorRow: "TOR", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "Q1", homeRow: "17", visitorRow: "25", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "Q2", homeRow: "43", visitorRow: "25", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "Q3", homeRow: "23", visitorRow: "27", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "Q4", homeRow: "36", visitorRow: "32", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "OT1", homeRow: "7", visitorRow: "14", isCurrentPeriod: false)
                
                GameColumnView(columnTitle: "Score", homeRow: "116", visitorRow: "123", isCurrentPeriod: false)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .background(
                RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder(Color.theme.secondaryBackground, lineWidth: 2)
            )
            .padding()
        }
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
}
