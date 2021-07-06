//
//  CustomDatePicker.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-07-05.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var gameDate: Date
    
    var body: some View {
        NavigationView {
            ZStack {
                // background
                Color.theme.background
                    .ignoresSafeArea()
                
                // content
                DatePicker("", selection: $gameDate, displayedComponents: .date)
                    .padding()
                    .labelsHidden()
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .onChange(of: gameDate, perform: { value in
                        presentationMode.wrappedValue.dismiss()
                    })
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        XMarkButton()
                    }
                }
            }
        }
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker(gameDate: .constant(Date()))
    }
}
