//
//  ViewController.swift
//  lab project Apple pie
//
//  Created by Sasha Cummings on 2/6/25.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program", "sasha"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    
    var totalLosses = 0

    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    

    @IBOutlet weak var letterButtons: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
}
    var currentGame: Game!
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        //let letterString = sender.configuration!.title!
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
    }
}

