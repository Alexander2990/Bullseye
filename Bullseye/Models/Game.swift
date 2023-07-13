//
//  Game.swift
//  Bullseye
//
//  Created by Александр on 13.07.2023.
//

import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  
  func points(sliderValue: Int) -> Int {
    var difference: Int = target - sliderValue
    
    if difference < 0 {
      difference *= -1
      // or difference = -difference
    }
    
    var awardedPoints: Int = 100 - difference
    return awardedPoints
  }
}
