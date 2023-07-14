//
//  ContentView.swift
//  Bullseye
//
//  Created by Александр on 11.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPut The Bullsete as close as you can to!".uppercased())
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .kerning(2.0)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            .padding(.all)
            Button("Hit me".uppercased()) {
                alertIsVisible = true
            }
            .padding(20.0)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(21.0)
            .bold()
            .font(.title3)
            .alert(
                "Hello there",
                isPresented: $alertIsVisible,
                actions: {
                    Button("Awesome") {
                        print("Alert closed")
                    }
                },
                message: {
                    let roundedValue = Int(sliderValue.rounded())
                    Text("""
            The slider's value is \(roundedValue).
            Your scored \(game.points(sliderValue: roundedValue)) points this round.
          """)
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
