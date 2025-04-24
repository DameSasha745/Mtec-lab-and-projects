//
//  PlayerTVCell.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/26/25.
//

import UIKit
protocol PlayerDetailsDelegate {
    func reloadeView()
}

class PlayerTVCell: UITableViewCell {
    
    var player: Player?
    var delegate: PlayerDetailsDelegate?

    @IBOutlet var playerIconImage: UIImageView!
    @IBOutlet var playerNameLabel: UILabel!
    @IBOutlet var scoreStepper: UIStepper!
    @IBOutlet var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        player?.score = Int(sender.value)
        scoreLabel.text = "Score: \(player?.score ?? 0)"
        delegate?.reloadeView()
    }
    
    func configureCell(player: Player) {
        playerNameLabel.text = player.name
        scoreLabel.text = "Score: \(player.score)"
        scoreStepper.value = Double(player.score)
        self.player = player
    }
}
