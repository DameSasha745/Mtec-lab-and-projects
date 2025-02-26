//
//  ViewController.swift
//  lab Login
//
//  Created by Sasha Cummings on 2/5/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    
    
    @IBOutlet weak var forgotUsernameButton: UIButton!
    
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "loginButton", sender: userName)
    }
    
    @IBAction func forgotUsernameButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "loginToLanding", sender: sender)
    }
    
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "loginToLanding", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = userName.text
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password!"
        } else if sender == forgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username!"
        } else {
            segue.destination.navigationItem.title = userName.text
        }
    }

}
