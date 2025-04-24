//
//  game.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 4/13/25.
//

import Foundation

struct Game: Codable {
    var name: String
    var highestWins: Bool
    var sortHighestToLowest: Bool = false
    var players: [Player]
    
    var currentWinner: Player? {
        if highestWins {
            players.max(by: { $0.score < $1.score })
        }
        else {
            players.min(by: { $0.score < $1.score })
        }
    }
    static var archiveURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("games.plist")
    }
}
