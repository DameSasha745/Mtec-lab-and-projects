//
//  PlayerDetailsTVC.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/26/25.
//

import UIKit

class PlayerDetailsTVC: UITableViewController {
    
    var onSavePlayer: ((Player) -> Void)?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!

    var newPlayer: Player?
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add New Player"
    }
    
    @IBAction func savePlayer(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
              let scoreText = scoreTextField.text,
              let score = Int(scoreText) else {
            return
        }
        let player = Player(name: name, score: score)
        
        onSavePlayer?(player)
        navigationController?.popViewController(animated: true)
    }
}
