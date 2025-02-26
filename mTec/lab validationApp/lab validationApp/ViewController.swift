//
//  ViewController.swift
//  lab validationApp
//
//  Created by Sasha Cummings on 2/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var userName: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var loginButton: UIStackView!
    
    @IBOutlet var userNameLabel: UILabel!
    
    @IBOutlet var forgotUserName: UIButton!
    
    @IBOutlet var forgotPassword: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgotUserNameButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "loginPageSegue", sender: sender)
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "loginPageSegue", sender: sender)
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let userName = userName.text ?? ""
        let password = password.text ?? ""
        
        if validdateUserName(userName: userName) && validatePassword(password) {
            
        } else {
            // Show an alert if validation fails
            let alert = UIAlertController(title: "Error", message: "You'r username or password is invalid.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password!"
        } else if sender == forgotUserName {
            segue.destination.navigationItem.title = "Forgot Username!"
        } else{
            segue.destination.navigationItem.title = "Welcome!"
        }
    }
    
    func validdateUserName(userName: String) -> Bool {
        guard userName.count >= 8 else {
            return false
        }
        let numberCharacters: [Character] = Array(arrayLiteral: "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
        
        if numberCharacters.contains(where: {char in userName.contains(char)}) {
            return true
        } else {
            return false
        }
    }
    func validatePassword(_ password: String) -> Bool {
        
        guard password.count >= 8 else {
            return false
        }
        let specialCharacters: [Character] = Array("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~")
        
        if specialCharacters.contains(where: {char in password.contains(char)}) {
            return true
        } else {
            return false
        }
    }
}

