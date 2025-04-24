//
//  GameTVC.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 4/13/25.
//

import UIKit

class GameTVC: UITableViewController {
    var games: [Game] = []
    var editingIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
       title = "Games"
//        loadGames()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
//    func loadGames() {
//        GameStorage.shared.loadGames()
//        games = GameStorage.shared.games
//        tableView.reloadData()
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = games[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameTVCell
        cell.configure(with: game)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewGame", let destination = segue.destination as? GameDetailTVC {
            let game = Game(name: "Untitled", highestWins: true, players: [])
            destination.game = game
            
            games.append(game)
            
            editingIndex = nil
        } else if segue.identifier == "ShowGame",
                  let destination = segue.destination as? GameDetailTVC,
                  let indexPath = tableView.indexPathForSelectedRow {
            let game = games[indexPath.row]
            destination.game = game
            
            editingIndex = indexPath.row
        }
    }
    
    @IBAction func saveGameDetailTVC(_ segue: UIStoryboardSegue) {
        guard let source = segue.source as? GameDetailTVC else { return }

//        if let index = editingIndex {
//            GameStorage.shared.updateGame(source.game, at: index)
//        } else {
//            GameStorage.shared.addGame(source.game)
//        }
//        loadGames()
    }

}
