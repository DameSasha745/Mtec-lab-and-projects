//
//  Player.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/26/25.
//

import Foundation

class Player: Codable {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
    
//    static var archiveURL: URL {
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        return documentsDirectory.appendingPathComponent("player.plist")
//    }
//    static func sameplePlayers() -> [Player] {
//        return [
//            Player(name: "Player 1", score: 10),
//            Player(name: "Player 2", score: 20)
//        ]
//    }
}
