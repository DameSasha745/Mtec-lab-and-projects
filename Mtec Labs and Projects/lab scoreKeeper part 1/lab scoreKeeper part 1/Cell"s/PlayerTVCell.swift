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
    @IBOutlet var scoreStepper: UIStepper!
    @IBOutlet var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    func configureCell(player: Player) {
        playerNameLabel.text = player.name
        scoreLabel.text = "Score: \(player.score)"
        scoreStepper.value = Double(player.score)
        
    }
}
