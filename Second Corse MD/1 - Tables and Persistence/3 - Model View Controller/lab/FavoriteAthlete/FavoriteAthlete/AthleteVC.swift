//
//  AthleteVC.swift
//  FavoriteAthlete
//
//  Created by Sasha Cummings on 3/3/25.
//

import UIKit

class AthleteVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
struct Athlete {
    var name: String
    var age: Int
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
