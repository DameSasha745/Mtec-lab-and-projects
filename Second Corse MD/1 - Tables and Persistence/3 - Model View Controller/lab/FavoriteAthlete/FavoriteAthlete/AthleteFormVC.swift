//
//  AthleteFormVC.swift
//  FavoriteAthlete
//
//  Created by Sasha Cummings on 3/3/25.
//

import UIKit

class AthleteFormVC: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var ageTextField: UITextField!
    
    @IBOutlet var leagueTextField: UITextField!
    
    @IBOutlet var teamTextField: UITextField!
    
    @IBOutlet var saveButton: UIButton!
    
    var athlete: Athlete?
    
    init?(coder: NSCoder, athlete: Athlete? = nil) {
        super.init(coder: coder)
        self.athlete = athlete
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    func updateView() {
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = String(athlete.age)
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        } else {
            print("")
        }
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let ageString = ageTextField.text, let age = Int(ageString), let league = leagueTextField.text, let team = teamTextField.text else { return }
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: "unwoundSegue", sender: self)
    }
}
