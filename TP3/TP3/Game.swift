//
//  Game.swift
//  TP3
//
//  Created by Guillaume Gonzales on 28/10/2020.
//

import Foundation

class Game {
    public static var sharedInstance = Game()
    
    var nbRound: Int = 0
    var finalValue: Int = 0
    
    private init() { }

    func reset() {
        nbRound = 0
        finalValue = Int.random(in: 0...100)
    }

    func checkValue(value: Int) -> GameStatus {        
        if value < finalValue {
            return GameStatus.UNDER
        } else if value > finalValue {
            return GameStatus.OVER
        } else {
            return GameStatus.EQUAL
        }
    }
}
