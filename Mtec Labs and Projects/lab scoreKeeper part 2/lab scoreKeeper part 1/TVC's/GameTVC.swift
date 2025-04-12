//
//  GameTVC.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/31/25.
//

import UIKit

class GameTVC: UITableViewController {
    
    var games: [Game] = [
        Game(name: "game", players: [Player(name: "Player #", score: 0)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Game List"
        loadGames()
        
        if games.isEmpty {
            games = [Game(name: "game", players: [Player(name: "Player #", score: 0)])]
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = games[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        if let winner = game.currentWinner {
            cell.detailTextLabel?.text = "current winner: \(winner.name)"
        }
        return cell
    }
    func saveGames() {
        if let data = try? JSONEncoder().encode(games) {
            UserDefaults.standard.set(data, forKey: "AddGame")
        }
    }
    func loadGames() {
        if let data = UserDefaults.standard.data(forKey: "AddGame"),
           let decoded = try? JSONDecoder().decode([Game].self, from: data) {
            games = decoded
        } else {
            games = []
        }
    }
    
    @IBSegueAction func addedGames(_ coder: NSCoder) -> PlayerListTVC? {
        guard let indexPath = tableView.indexPathForSelectedRow else { return nil }
        let selectedGame = games[indexPath.row]
        
        let controller = PlayerListTVC(coder: coder)
        controller?.game = selectedGame
        controller?.onGameUpdated = { [weak self] updatedGame in
            self?.games[indexPath.row] = updatedGame
            self?.saveGames()
            self?.tableView.reloadData()
        }
        return controller
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if segue.identifier == "AddGame", let destination = segue.destination as? PlayerListTVC {
                let newGame = Game(name: "New Game", players: [])
                games.append(newGame)
                destination.game = newGame
                destination.onGameUpdated = { [weak self] updatedGame in
                    if let index = self?.games.firstIndex(where: { $0.name == updatedGame.name }) {
                        self?.games[index] = updatedGame
                    }
                    self?.games.append(updatedGame)
                    self?.saveGames()
                    self?.tableView.reloadData()
                }
            } else if segue.identifier == "ShowPlayerList",
                      let indexPath = tableView.indexPathForSelectedRow {
                destination.game = games[indexPath.row]
            }
        }
    }
    
    @IBAction func unwindToPlayerList(segue: UIStoryboardSegue) {
        tableView.reloadData()
        
    }
}
