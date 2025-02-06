//
//  ViewController.swift
//  Lab_BasicI_nteractions
//
//  Created by Sasha Cummings on 1/28/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setText(_ sender: UITextField) {
        Label.text = textField.text
    }
    
    @IBAction func clearText(_ sender: Any) {
        textField.text = ""
        Label.text = ""
    }
}

