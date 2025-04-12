//
//  Player.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/26/25.
//

import Foundation

struct Player: Codable {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
struct Game: Codable, Equatable {
    var id: UUID = UUID()
    var name: String
    var players: [Player]
    
    var currentwinner: Player? {
        return players.max(by: {$0.score < $1.score })
    }
    static func ==(lhs: Game, rhs: Game) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(name: String, players: [Player] = []) {
        self.name = name
        self.players = players
    }
    
    var currentWinner: Player? {
        return players.max(by: { $0.score < $1.score })
    }
}
