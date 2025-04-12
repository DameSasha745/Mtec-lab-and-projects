//
//  PlayerListTVC.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/26/25.
//

import UIKit

class PlayerListTVC: UITableViewController {
    
    var players: [Player] = [] {
        didSet {
            savePlayers(players: players)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Player List"
        
        if let savedPlayers = loadPlayers() {
            players = savedPlayers
        } else {
            players = Player.sameplePlayers()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func savePlayers(players: [Player]) {
        let encoder = PropertyListEncoder()
        do {
            let encodedPlayers = try? encoder.encode(players)
            try? encodedPlayers?.write(to: Player.archiveURL)
        }
    }
    func loadPlayers() -> [Player]? {
        let decoder = PropertyListDecoder()
        do {
            if let data = try? Data(contentsOf: Player.archiveURL),
               let players = try? decoder.decode([Player].self, from: data) {
                return players
            } else {
                return nil
            }
        }
    }
    @IBSegueAction func addPlayer(_ coder: NSCoder) -> PlayerDetailsTVC? {
        return PlayerDetailsTVC(coder: coder, player: nil)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerTVCell
        let player = players[indexPath.row]
        cell.configureCell(player: player)
        
        return cell
    }
    
    @IBAction func didChangeScore(_ sender: UIStepper) {
        if let indexPath = tableView.indexPathForRow(at: sender.superview!.convert(sender.frame.origin, to: tableView)) {
            players[indexPath.row].score = Int(sender.value)
            reloadAndSortPlayers()
        }
    }
    @IBAction func unwindToPlayerList(segue: UIStoryboardSegue) {
        guard let playerDetailsTVC = segue.source as? PlayerDetailsTVC, let player = playerDetailsTVC.player
        else {
            return
        }
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            players[selectedIndexPath.row] = player
        } else {
            players.append(player)
        }
        savePlayers(players: players)
        reloadAndSortPlayers()
    }
    
    func reloadAndSortPlayers() {
        players.sort { $0.score > $1.score }
        tableView.reloadData()
    }
}
