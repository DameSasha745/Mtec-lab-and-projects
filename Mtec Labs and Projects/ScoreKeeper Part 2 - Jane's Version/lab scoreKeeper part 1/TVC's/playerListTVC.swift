//
//  playerListTVC.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 4/16/25.
//


    import UIKit
    
class PlayerListTVC: UITableViewController, PlayerDetailsDelegate {
    func reloadeView() {
        game?.players.sort { $0.score > $1.score }
        tableView.reloadData()
    }
    
    
        var game: Game?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.title = "Player List"
//            players = game?.players ?? []
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tableView.reloadData()
        }
        
        @IBAction func didChangeScore(_ sender: UIStepper) {
            if let indexPath = tableView.indexPathForRow(at: sender.superview!.convert(sender.frame.origin, to: tableView)) {
                game?.players[indexPath.row].score = Int(sender.value)
//                reloadAndSortPlayers()
            }
        }
            func reloadTableView() {
                game?.players.sort { $0.score > $1.score }
                tableView.reloadData()
            }
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if let game {
                return game.players.count
            } else {
                print("Game not found in PLTVC!")
                return 0
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTVCell
            if let player = game?.players[indexPath.row] {
                cell.configureCell(player: player)
            } else {
                print("Could not find player when dequeuing cell!")
                return cell
            }
            
            return cell
        }
        
        @IBAction func unwindFromPlayerDetails(_ segue: UIStoryboardSegue) {
            guard let source = segue.source as? PlayerDetailsTVC,
                  let newPlayer = source.player else {
                print("Unwound but could not find player!")
                return
            }
    
            tableView.reloadData()
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destination = segue.destination as? PlayerDetailsTVC else { return }
            
            if segue.identifier == "AddPlayer" {
                let player = Player(name: "", score: 0)
                game?.players.append(player)
                
                destination.player = player
            }
        }
    }
