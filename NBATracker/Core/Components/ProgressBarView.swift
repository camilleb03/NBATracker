//
//  ProgressBarView.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-27.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var value: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width , height: geometry.size.height)
                    .foregroundColor(Color.theme.green)
                
                Rectangle()
                    .frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color.theme.blue)
                    .animation(.linear)
            }
            .cornerRadius(45.0)
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressBarView(value: .constant(0.5))
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            ProgressBarView(value: .constant(0.21))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
