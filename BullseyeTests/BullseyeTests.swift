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
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegtive() {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
}
