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
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, 100)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            }
            SliderView(sliderValue: $sliderValue)
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut The Bullsete as close as you can to!")
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        VStack {
            HStack {
                SliderLabelText(text: "1")
                Slider(value: $sliderValue, in: 1.0...100.0)
                SliderLabelText(text: "100")
            }
            .padding(.all)
        }
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button("Hit me".uppercased()) {
            alertIsVisible = true

        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
            })
        .foregroundColor(.white)
        .cornerRadius(21.0)
        .bold()
        .font(.title3)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .alert(isPresented: $alertIsVisible, content: {
          let roundedValue = Int(sliderValue.rounded())
          let points = game.points(sliderValue: roundedValue)
          return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(points) points this round."), dismissButton: .default(Text("Awesome!")) {
            game.startNewRound(points: points)
          })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
