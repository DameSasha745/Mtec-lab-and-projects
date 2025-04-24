//
//  GameStorage.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 4/14/25.
//

import Foundation

class GameStorage {
    static var shared = GameStorage()
    
    private(set) var games: [Game] = []

    private init() {
        loadGames()
    }

    func loadGames() {
        if let data = try? Data(contentsOf: Game.archiveURL),
           let saved = try? PropertyListDecoder().decode([Game].self, from: data) {
            games = saved
        }
    }

    func saveGames() {
        if let data = try? PropertyListEncoder().encode(games) {
            try? data.write(to: Game.archiveURL)
        }
    }

    func addGame(_ game: Game) {
        games.append(game)
        saveGames()
    }

    func updateGame(_ game: Game, at index: Int?) {
        if let idx = index, idx < games.count {
            games[idx] = game
        } else {
            games.append(game)
        }
        saveGames()
    }

    func game(at index: Int) -> Game {
        return games[index]
    }
}
