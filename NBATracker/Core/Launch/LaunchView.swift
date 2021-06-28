//
//  LaunchScreen.swift
//  NBATracker
//
//  Created by Camille Bourbonnais on 2021-06-24.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Loading NBA data".map { String($0) }
    @State private var showLoadingText: Bool = false
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    
    @Binding var showLaunchView: Bool
    
    @State private var animateRotation: Bool = false
    @State private var animateBounce: Bool = false
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            
            Circle()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 50, height: 50)
                .rotation3DEffect(
                    Angle(degrees: 60),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    anchor: .center,
                    anchorZ: 0.0,
                    perspective: 1.0
                )
                .offset(y: 45)
                .opacity(animateBounce ? 1 : 0)
            
            Image("basketball-logo")
                .resizable()
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: animateRotation ? 360 : 0))
                .offset(y: animateBounce ? 10 : -25)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.launch.accent)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 100)
        }
        .onAppear {
            showLoadingText.toggle()
            animateBall()
        }
        .onReceive(timer, perform: { _ in
            animateText()
        })
    }
    
    private func animateBall() {
        
        withAnimation(Animation.easeInOut(duration: 0.35).repeatForever(autoreverses: true)) {
            animateBounce.toggle()
        }
        
        withAnimation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false)) {
            animateRotation.toggle()
        }
    }
    
    private func animateText() {
        withAnimation(.spring()) {
            
            let lastIndex = loadingText.count
            if counter == lastIndex {
                counter = 0
                loops += 1
                
                if loops >= 1 {
                    showLaunchView = false
                }
            } else {
                counter += 1
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
