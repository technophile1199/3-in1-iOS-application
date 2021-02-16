//
//  GameState.swift
//  RockPaperScissors
//
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    static func getObj(playerSign: Sign, computerSign: Sign) -> GameState {
        if playerSign.defeats(computerSign) {
            return .win
        } else if computerSign.defeats(playerSign) {
            return .lose
        } else {
            return .draw
        }
    }
    
    var text : String {
        switch self {
        case .start:
            return "PLease Select Rock, Paper, or Scissors"
        case .win:
            return "You Win!"
        case .lose:
            return "You Lost"
        case .draw:
            return "It's a tie!"
        }
    }
}
