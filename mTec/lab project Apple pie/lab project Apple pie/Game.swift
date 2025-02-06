//
//  Game.swift
//  lab project Apple pie
//
//  Created by Sasha Cummings on 2/6/25.
//

import Foundation

struct Game {
    var word : String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
