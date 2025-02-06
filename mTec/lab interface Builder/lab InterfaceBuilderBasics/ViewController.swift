//
//  ViewController.swift
//  lab InterfaceBuilderBasics
//
//  Created by Sasha Cummings on 1/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var changeTitle: UIButton! 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func PressMe(_ sender: Any) {
        mainLabel.text = "This app rocks!"
    }
    
}

