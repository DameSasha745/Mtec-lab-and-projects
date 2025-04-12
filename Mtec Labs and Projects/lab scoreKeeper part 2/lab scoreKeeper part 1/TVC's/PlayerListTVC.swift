//
//  PlayerListTVC.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/26/25.
//

import UIKit

class PlayerListTVC: UITableViewController {
    
    var game: Game?
    
    var onGameUpdated: ((Game) -> Void)?
    
    @IBOutlet weak var playerListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onGameUpdated?(game!)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePlayerListLabel()
        tableView.reloadData()
    }
    @IBAction func sortPlayersByChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            game?.players.sort { $0.score > $1.score }
        } else {
            game?.players.sort { $0.score < $1.score }
        }
        updatePlayerListLabel()
    }
    
    @IBAction func whoWinsChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            game?.players.sort { $0.score > $1.score }
        } else {
            game?.players.sort { $0.score < $1.score }
        }
        updatePlayerListLabel()
    }
    func updatePlayerListLabel() {
        let names = game?.players.map { "\($0.name): \($0.score)" } ?? []
        playerListLabel.text = names.isEmpty ? "No players added yet" :names.joined(separator: "\n")
    }
    func savePlayers() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(game?.players) {
            UserDefaults.standard.set(encoded, forKey: "savedPlayers")
        }
    }
    func loadPlayers() -> [Player]? {
        if let savedData = UserDefaults.standard.data(forKey: "savedPlayers") {
            let decoder = JSONDecoder()
            if let loadedPlayers = try? decoder.decode([Player].self, from: savedData) {
                return loadedPlayers
            }
        }
        return nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "SaveGameAndGoBack" {
                if let updatedGame = game {
                    onGameUpdated?(updatedGame)
                }
            }

            if segue.identifier == "AddNewPlayer",
               let destination = segue.destination as? PlayerDetailsTVC {
                destination.onSavePlayer = { [weak self] newPlayer in
                    self?.game?.players.append(newPlayer)
                    self?.savePlayers()
                    self?.updatePlayerListLabel()
                    self?.tableView.reloadData()
                    if let updatedGame = self?.game {
                        self?.onGameUpdated?(updatedGame)
                }
            }
        }

    }
}
