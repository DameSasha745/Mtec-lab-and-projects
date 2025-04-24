//
//  GameDetailTVC.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 4/13/25.
//

import UIKit

class GameDetailTVC: UITableViewController {
  
    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var whoWinsSegmentControl: UISegmentedControl!
    
    var game: Game!
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("Current players in game:", game.players.map { $0.name })
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        game.sortHighestToLowest = sortSegmentControl.selectedSegmentIndex == 0
        game.highestWins = whoWinsSegmentControl.selectedSegmentIndex == 0
        
        print("In GameDetailTVC, game: \(game.name)")
        
        if segue.identifier == "toPlayerList",
           let destination = segue.destination as? PlayerListTVC {
            print("Destination successfully unwrapped as PLTVC")
            destination.game = game
        }
    }
    //    @IBAction func savePlayers(_ segue: UIStoryboardSegue) {
//
//    }
}
