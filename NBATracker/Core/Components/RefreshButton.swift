//
//  RefreshButton.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-27.
//

import SwiftUI

struct RefreshButton: View {
    
    @Binding var isLoading: Bool
    var action: (() -> ())
    
    var body: some View {
        Button(
            action: action,
            label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0), anchor: .center)
    }
}

struct RefreshButton_Previews: PreviewProvider {
    static var previews: some View {
        RefreshButton(isLoading: .constant(false)) {
            // perform action
        }
    }
}
