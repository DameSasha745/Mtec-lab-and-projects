//
//  detialVC.swift
//  lab validationApp
//
//  Created by Sasha Cummings on 2/21/25.
//

import UIKit

class detialVC: UIViewController {
    
    @IBOutlet var conformationText: UITextField!
    
    var username: String?
    var loginConfirmation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let confirmation = loginConfirmation {
            conformationText.text = confirmation
        }
    }
}
