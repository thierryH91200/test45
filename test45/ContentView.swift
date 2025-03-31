//
//  Untitled.swift
//  test42
//
//  Created by Thierry hentic on 27/03/2025.
//

//
// From SwiftUI by Example by Paul Hudson (@twostraws)
// https://www.hackingwithswift.com/quick-start/swiftui
// License: https://www.hackingwithswift.com/license
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationsRunning = false
    @State private var isActive = false
    
    let gradient = LinearGradient(
        colors: [.blue, .green],
        startPoint: .leading,
        endPoint: .trailing
    )

    var body: some View {

        Button("Start Animations") {
            withAnimation {
                animationsRunning.toggle()
            }
        }

        VStack {
            HStack {
                Image(systemName: "gear")
                    .symbolEffect(.rotate, value: animationsRunning)
                
                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.cumulative, value: animationsRunning)
                
                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.iterative, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.cumulative, value: animationsRunning)
            }

            HStack {
                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.iterative, options: .repeating, value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.cumulative, options: .repeat(3), value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.iterative, options: .speed(3), value: animationsRunning)

                Image(systemName: "square.stack.3d.up")
                    .symbolEffect(.variableColor.reversing.cumulative, options: .repeat(3).speed(3), value: animationsRunning)
            }
            
            
            VStack {
                
                Toggle(isOn: $isActive, label: {
                    Text("Togle \(Text("Animation").foregroundStyle(gradient))")
                        .bold()
                        .font(.title)
                        .textCase(.uppercase)
                })
                .padding()
                
                Image(systemName: "wifi")
                    .foregroundColor(.green)
                    .symbolEffect(.variableColor, value: isActive)
                    .font(.system(size: 100))
                
            }
            .padding()
        }
        .font(.largeTitle)
    }
}

