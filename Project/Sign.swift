//
//  Sign.swift
//  RockPaperScissors
//
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

enum Sign  {
    case rock, paper, scissors
    
    static func random() -> Sign {
        let sign = randomChoice.nextInt()
        if sign == 0 {
            return .rock
        } else if sign == 1 {
            return .paper
        } else {
            return .scissors
        }
    }
    
    func defeats(_ otherSign: Sign) -> Bool {
        switch (self, otherSign) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return true
        default:
            return false
        }
    }
    
    var emoji : String {
        switch self {
        case .rock:
            return "✊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
}
