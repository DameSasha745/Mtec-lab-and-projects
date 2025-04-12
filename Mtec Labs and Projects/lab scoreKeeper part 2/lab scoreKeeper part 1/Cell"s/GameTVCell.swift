//
//  GameTVCell.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/31/25.
//

import UIKit

class GameTVCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var playerNameText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configureCell(game: Game, player: Player) {
        playerNameText.text = player.name
        gameNameLabel.text = game.name
    }
}
