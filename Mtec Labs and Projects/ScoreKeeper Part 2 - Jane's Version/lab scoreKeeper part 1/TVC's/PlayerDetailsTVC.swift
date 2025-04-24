//
//  PlayerDetailsTVC.swift
//  lab scoreKeeper part 1
//
//  Created by Sasha Cummings on 3/26/25.
//

import UIKit

class PlayerDetailsTVC: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scoreTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add New Player"
        
        nameTextField.addTarget(self, action: #selector(textFielsChanged), for: .editingChanged)
        scoreTextField.addTarget(self, action: #selector(textFielsChanged), for: .editingChanged)
        textFielsChanged()
        updateView()
    }
    
    @objc func textFielsChanged() {
        let isFormValid = !(nameTextField.text?.isEmpty ?? true) && Int(scoreTextField.text ?? "") != nil
        saveButton.isEnabled = isFormValid
    }
    
    func updateView() {
        if let player = player {
            nameTextField.text = player.name
            scoreTextField.text = String(player.score)
        } else {
            print("")
        }
    }
    
    @IBAction func savePlayer(_ sender: UIButton) {
        guard let name = nameTextField.text, let scoreText = scoreTextField.text, let score = Int(scoreText), score >= 0 else {
            return
        }
        
        player?.name = name
        player?.score = score
    }
}
