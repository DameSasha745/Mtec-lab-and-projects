//
//  gameTVCell.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 4/13/25.
//

import UIKit

class GameTVCell: UITableViewCell {
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!

    func configure(with game: Game) {
        gameTitleLabel.text = game.name
        winnerLabel.text = "\(game.currentWinner?.name ?? "N/A")"
    }
}

