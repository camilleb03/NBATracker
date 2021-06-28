//
//  TeamImageView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-14.
//

import SwiftUI

struct TeamImageView: View {
    
    @StateObject private var vm: TeamImageViewModel
    
    init(teamTricode: String, logoType: LogoType) {
        _vm = StateObject(wrappedValue: TeamImageViewModel(teamTricode: teamTricode, logoType: logoType))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "person.3")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct TeamImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamImageView(teamTricode: dev.team1.tricode, logoType: .primary)
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            TeamImageView(teamTricode: dev.team1.tricode, logoType: .secondary)
                .padding()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
