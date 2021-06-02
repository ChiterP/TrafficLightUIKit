//
//  ContentView.swift
//  TrafficLight
//
//  Created by 18316409 on 01.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentLight = CurrentLight.red
    @State private var nameButton = "START"
    @State private var redCircle = ColorCircle(color: .red.opacity(0.3))
    @State private var yalowCircle = ColorCircle(color: .yellow.opacity(0.3))
    @State private var greenCircle = ColorCircle(color: .green.opacity(0.3))
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                redCircle
                    .padding()
                yalowCircle
                greenCircle
                    .padding()
                Spacer()
                
                Button (action: {
                    nameButton = "NEXT"
                    changeColor()
                })
                {
                    ZStack {
                        Color(.white)
                            .frame(width: 112, height: 42)
                            .cornerRadius(5)
                        Color(.blue)
                            .frame(width: 108, height: 38)
                            .cornerRadius(5)
                        Text("\(nameButton)")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 110, height: 40)
                            .cornerRadius(5)
                            .padding()
                    }
                }
            }
        }
    }
    
    func changeColor() {
        let lightIsOff: Double = 0.3
        let lightIsOn: Double = 1
        
        switch currentLight {
        case .red:
            greenCircle = ColorCircle(color: .green.opacity(lightIsOff))
            redCircle = ColorCircle(color: .red.opacity(lightIsOn))
            currentLight = .yellow
        case .yellow:
            redCircle = ColorCircle(color: .red.opacity(lightIsOff))
            yalowCircle = ColorCircle(color: .yellow.opacity(lightIsOn))
            currentLight = .green
        case .green:
            yalowCircle = ColorCircle(color: .yellow.opacity(lightIsOff))
            greenCircle = ColorCircle(color: .green.opacity(lightIsOn))
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum CurrentLight {
    case red, yellow, green
}
