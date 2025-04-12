//
//  PlayerTVCell.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/26/25.
//

import UIKit

class PlayerTVCell: UITableViewCell {

    @IBOutlet var playerIconImage: UIImageView!
    @IBOutlet var playerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configureCell(player: Player) {
        playerNameLabel.text = player.name
    }
}
