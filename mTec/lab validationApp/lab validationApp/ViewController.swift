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
        userNameLabel.isHidden = true
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
        performSegue(withIdentifier: "loginButtonSegue", sender: sender)
        
        if validdateUserName(userName: userName) && validatePassword(_password: password) {
            userNameLabel.text = "Welcome \(userName)!"
            userNameLabel.isHidden = false
            
            
            if let DetailVC = storyboard?.instantiateViewController(withIdentifier: "detialVC") as? detialVC {
                DetailVC.username = userName
                DetailVC.loginConfirmation = "\(userName), you have succesfully logged in! congrates on getting this far!"
                navigationController?.pushViewController(DetailVC, animated: true)
            }
        } else {
            // Show an alert if validation fails
            let alert = UIAlertController(title: "Error", message: "You'r username or password is invalid.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func validdateUserName(userName: String) -> Bool {
        return !userName.isEmpty
    }
    func validatePassword(_password: String) -> Bool {
        let passwordRegex = "^(?+>*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: password)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password!"
        } else if sender == forgotUserName {
            segue.destination.navigationItem.title = "Forgot Username!"
        } else {
            
        }
    }
}



