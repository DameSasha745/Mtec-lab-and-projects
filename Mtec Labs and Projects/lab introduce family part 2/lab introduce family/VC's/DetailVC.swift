//
//  DetailVC.swift
//  lab introduce family
//
//  Created by Sasha Cummings on 3/21/25.
//

import UIKit

class DetailVC: UIViewController {

        @IBOutlet var namelabel: UILabel!
        @IBOutlet var imageView: UIImageView!
        @IBOutlet var relationshipLabel: UITextView!
    @IBOutlet var discriptionLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    
    
    
    
    
    var person: Person?

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            guard let person = person else { return }
            namelabel.text = person.name
            imageView.image = UIImage(named: person.imageName)
            relationshipLabel.text = person.relationship
            ageLabel.text = person.age
            discriptionLabel.text = person.detail
        }

        override func viewDidLoad() {
            super.viewDidLoad()
        }
    }

