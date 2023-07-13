//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Александр on 13.07.2023.
//

import XCTest
@testable import Bullseye

final class BullseyeTests: XCTestCase {
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() {
    var guess = game.target + 5
    var score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegtive() {
    var guess = game.target - 5
    var score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
}
